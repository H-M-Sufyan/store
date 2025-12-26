import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:store/screens/admin_screens/admin_dashboard_screen.dart';
import 'package:store/screens/auth_screens/login_screen.dart';
import 'package:store/screens/user_screens/Home_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ObscuredController extends GetxController {
  RxBool is_obscured = true.obs;

  void toogleObscure() {
    is_obscured.value = !is_obscured.value;
  }
}

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxBool isLoading = false.obs;

  // GOOGLE
  Future<void> googleLogin() async {
    try {
      isLoading.value = true;

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await auth.signInWithCredential(
        credential,
      );

      String uid = userCredential.user!.uid;

      // 🔍 CHECK IF USER EXISTS
      DocumentSnapshot userDoc = await firestore
          .collection("users")
          .doc(uid)
          .get();

      if (!userDoc.exists) {
        // NEW GOOGLE USER
        await firestore.collection("users").doc(uid).set({
          "email": userCredential.user!.email,
          "isAdmin": false,
          "createdAt": FieldValue.serverTimestamp(),
        });
      }

      await checkUserRoleAndNavigate(uid);
    } catch (e) {
      print("Google login failed: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> checkUserRoleAndNavigate(String uid) async {
    DocumentSnapshot userDoc = await firestore
        .collection("users")
        .doc(uid)
        .get();

    bool isAdmin = userDoc["isAdmin"] ?? false;

    if (isAdmin) {
      Get.offAll(() => AdminDashboardScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  // EMAIL
  Future<void> LoginWithEmail(String email, String pass) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );

      String uid = userCredential.user!.uid;
      await checkUserRoleAndNavigate(uid);

      Get.snackbar("Success", "Login Successful!");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> registerEmail(String email, String pass) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      String uid = userCredential.user!.uid;

      await firestore.collection("users").doc(uid).set({
        "email": email,
        "isAdmin": false,
        "createdAt": FieldValue.serverTimestamp(),
      });

      Get.snackbar("Success", "Account Created!");
      Get.off(LoginScreen());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // Logout
  void logout() async {
    await auth.signOut();
    Get.offAll(LoginScreen());
  }
}

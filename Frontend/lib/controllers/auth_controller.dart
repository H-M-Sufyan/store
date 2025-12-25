import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:store/screens/auth_screens/login_screen.dart';
import 'package:store/screens/user_screens/Home_Screen.dart';

class ObscuredController extends GetxController {
  RxBool is_obscured = true.obs;

  void toogleObscure() {
    is_obscured.value = !is_obscured.value;
  }
}

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  // GOOGLE
  Future<void> googleLogin() async {
    try {
      isLoading.value = true;
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await auth.signInWithCredential(credential);
      Get.offAll(HomeScreen());
    } catch (e) {
      print("Google login failed: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // EMAIL
  Future<void> LoginWithEmail(String email, String pass) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: pass);
      await Get.offAll(HomeScreen());
      Get.snackbar("Success", "Successfully Login!");
    } catch (e) {
      Get.snackbar("Error", "Error: $e");
    }
  }

  Future<void> registerEmail(String email, String pass) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: pass);
      Get.snackbar("Success", "Successfully Account Created!");
      Get.off(LoginScreen());
    } catch (e) {
      Get.snackbar("Error", "Error: $e");
    }
  }

  // Logout
  void logout() async {
    await auth.signOut();
    Get.offAll(LoginScreen());
  }
}

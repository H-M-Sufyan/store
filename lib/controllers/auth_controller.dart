import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
    };
  }
}

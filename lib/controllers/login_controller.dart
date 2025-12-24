import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool is_obscured = true.obs;

  void toogleObscure() {
    is_obscured.value = !is_obscured.value;
  }
}

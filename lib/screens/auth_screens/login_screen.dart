import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:store/constants/colors.dart';
import 'package:store/controllers/auth_controller.dart';
import 'package:store/screens/auth_screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final ObscuredController obscuredController = Get.put(ObscuredController());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Get.height * 0.2),
              Expanded(
                child: Obx(() {
                  return Column(
                    children: [
                      Text(
                        "Welcome Back To Sufyan's Store",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Text(
                        "Please Enter Login Details to Login",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.TextBColor,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.04),
                      TextField(
                        controller: email,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Enter Your Email",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.02),
                      TextField(
                        controller: password,
                        obscureText: obscuredController.is_obscured.value,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter Your Password",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              obscuredController.toogleObscure();
                            },
                            icon: Icon(
                              obscuredController.is_obscured.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.06),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 6,
                          backgroundColor: Colors.deepOrangeAccent[400],
                          shadowColor: Colors.deepOrangeAccent[400],
                          padding: const EdgeInsets.symmetric(
                            horizontal: 68,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "SignIn",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      SizedBox(height: Get.height * 0.04),
                      Obx(() {
                        return Container(
                          child: authController.isLoading.value
                              ? CircularProgressIndicator(
                                  color: Colors.black,
                                  strokeWidth: 2,
                                )
                              : IconButton(
                                  onPressed: () async {
                                    await authController.googleLogin();
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.google,
                                    size: 50,
                                  ),
                                ),
                        );
                      }),
                    ],
                  );
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: AppColors.PrimColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(SignupScreen());
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        color: AppColors.PrimColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

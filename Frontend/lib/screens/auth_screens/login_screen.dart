import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: 21,
                  right: 21,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                ),
                child: Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: Get.height * 0.15),

                      Text(
                        "Welcome Back To Sufyan's Store",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),

                      SizedBox(height: Get.height * 0.02),

                      Text(
                        "Please Enter Login Details to Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.TextBColor,
                        ),
                      ),

                      SizedBox(height: Get.height * 0.04),

                      TextField(
                        controller: email,
                        style: const TextStyle(fontSize: 16),
                        decoration: const InputDecoration(
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
                        style: const TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter Your Password",
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: obscuredController.toogleObscure,
                            icon: Icon(
                              obscuredController.is_obscured.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),

                      SizedBox(height: Get.height * 0.06),

                      ElevatedButton(
                        onPressed: () {
                          authController.LoginWithEmail(
                            email.text.trim(),
                            password.text.trim(),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 6,
                          backgroundColor: Colors.deepOrangeAccent,
                          shadowColor: Colors.deepOrangeAccent,
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

                      authController.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Colors.black,
                              strokeWidth: 2,
                            )
                          : IconButton(
                              onPressed: authController.googleLogin,
                              icon: const FaIcon(
                                FontAwesomeIcons.google,
                                size: 50,
                              ),
                            ),

                      const SizedBox(height: 20),
                    ],
                  );
                }),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 8),
              child: Row(
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
                      Get.to(() => SignupScreen());
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
            ),
          ],
        ),
      ),
    );
  }
}

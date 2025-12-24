import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:store/constants/colors.dart';
import 'package:store/controllers/auth_controller.dart';
import 'package:store/screens/auth_screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Get.height * 0.1),
              Expanded(
                child: Obx(() {
                  return Column(
                    children: [
                      Text(
                        "Welcome To Sufyan's Store",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Text(
                        "Please Enter Details to SignUp",
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
                        obscureText: loginController.is_obscured.value,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter Your Password",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              loginController.toogleObscure();
                            },
                            icon: Icon(
                              loginController.is_obscured.value
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
                          "SignUp",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Have An Account?", style: TextStyle(fontSize: 16),),
                  TextButton(
                    onPressed: () {
                      Get.off(LoginScreen());
                    },
                    child: Text(
                      "SignIn",
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

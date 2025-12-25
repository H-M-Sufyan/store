import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:store/constants/colors.dart';
import 'package:store/screens/auth_screens/login_screen.dart';
import 'package:store/screens/user_screens/Home_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Get.offAll(LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: Get.width,
                    child: Lottie.asset('assets/images/shoppingcart.json'),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: Get.width,
                    child: Center(
                      child: Text(
                        "Welcome To Store",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: AppColors.TextPrimColor,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Get Everything in one place",
                    style: TextStyle(
                      color: AppColors.TextSecColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 14),
              child: Text(
                "Powered By H.M.Sufyan",
                style: TextStyle(
                  color: AppColors.TextPrimColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

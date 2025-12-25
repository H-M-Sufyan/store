import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:store/constants/colors.dart';

import '../controllers/auth_controller.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final AuthController authController = Get.put(AuthController());
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: AppColors.PrimColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Wrap(
          runSpacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  'Sufyan',
                  style: TextStyle(color: AppColors.TextPrimColor),
                ),
                subtitle: Text(
                  'Version 1.0.0',
                  style: TextStyle(color: AppColors.TextPrimColor),
                ),
                leading: CircleAvatar(
                  radius: 22,
                  backgroundColor: AppColors.SecColor,
                  child: Text(
                    'S',
                    style: TextStyle(color: AppColors.TextPrimColor),
                  ),
                ),
              ),
            ),
            Divider(
              indent: 10,
              endIndent: 10,
              thickness: 1.5,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  'Home',
                  style: TextStyle(color: AppColors.TextPrimColor),
                ),
                leading: Icon(Icons.home, color: AppColors.TextPrimColor),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppColors.TextPrimColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  'Products',
                  style: TextStyle(color: AppColors.TextPrimColor),
                ),
                leading: Icon(
                  Icons.production_quantity_limits,
                  color: AppColors.TextPrimColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppColors.TextPrimColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  'Orders',
                  style: TextStyle(color: AppColors.TextPrimColor),
                ),
                leading: Icon(
                  Icons.shopping_bag,
                  color: AppColors.TextPrimColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppColors.TextPrimColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  'Contact',
                  style: TextStyle(color: AppColors.TextPrimColor),
                ),
                leading: Icon(
                  Icons.contact_page_rounded,
                  color: AppColors.TextPrimColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppColors.TextPrimColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                onTap: () {
                  authController.logout();
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  'Logout',
                  style: TextStyle(color: AppColors.TextPrimColor),
                ),
                leading: Icon(Icons.logout, color: AppColors.TextPrimColor),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppColors.TextPrimColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

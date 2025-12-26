import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:store/constants/colors.dart';
import 'package:store/screens/admin_screens/Add_Product_Screen.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.PrimColor,
        centerTitle: true,
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Admin Dashboard!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              Get.to(AddProductScreen());
            }, child: Text("Add Product")),
          ],
        ),
      ),
    );
  }
}

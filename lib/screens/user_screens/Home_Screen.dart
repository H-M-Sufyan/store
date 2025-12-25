import 'package:flutter/material.dart';
import 'package:store/constants/colors.dart';
import 'package:store/widgets/banner_widget.dart';
import 'package:store/widgets/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.TextPrimColor
        ),
        backgroundColor: AppColors.PrimColor,
        title: Text(
          "Sufyan's Store",
          style: TextStyle(
            color: AppColors.TextPrimColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
              IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),
            ],
          )
        ],
        centerTitle: true,
      ),
      drawer: DrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                BannerWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

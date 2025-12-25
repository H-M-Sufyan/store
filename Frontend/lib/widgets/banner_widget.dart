import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:store/constants/colors.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Stack(
          children: [
            Container(
              width: Get.width - 10,
              child: Image.asset("assets/images/banner2.jpg", fit: BoxFit.cover,),
            ),
            Positioned(
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  color: AppColors.SecColor,
                ),
                width: MediaQuery.of(context).size.width / 1.8,
                height: 205,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Gatis Ongkir',
                      style: TextStyle(
                        color: AppColors.TextPrimColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Selama PPKM!',
                      style: TextStyle(
                        color: AppColors.TextPrimColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Period - August 2025',
                      style: TextStyle(
                        color: AppColors.TextSecColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        Stack(
          children: [
            Container(
              width: Get.width,
              child: Image.asset("assets/images/banner1.jpg"),
            ),
            Positioned(
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  color: AppColors.SecColor,
                ),
                width: MediaQuery.of(context).size.width / 1.8,
                height: 205,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Gatis Ongkir',
                      style: TextStyle(
                        color: AppColors.TextPrimColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Selama PPKM!',
                      style: TextStyle(
                        color: AppColors.TextPrimColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Period - August 2025',
                      style: TextStyle(
                        color: AppColors.TextSecColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        autoPlay: true,
        aspectRatio: 2,
        viewportFraction: 1,
      ),
    );
  }
}

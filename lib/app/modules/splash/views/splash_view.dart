import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nevina_infotech/app/constants/app_colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white.withOpacity(.7),
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          int sensitivity = 1;
          if (details.delta.dy > sensitivity) {
            print('Doum Swiped');
          } else if (details.delta.dy < -sensitivity) {
            print('Up Swiped');
          }
          controller.goToLogin();
        },
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: Get.height,
                width: Get.width,
                child: Image.asset(
                  controller.logo,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

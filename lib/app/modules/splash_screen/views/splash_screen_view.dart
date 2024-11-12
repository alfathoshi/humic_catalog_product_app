import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic/app/routes/app_pages.dart';
import 'package:rive/rive.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.toNamed(Routes.NAVIGATION_BAR);
    });

    return const Scaffold(
      body: RiveAnimation.asset(
        'assets/rive/splashscreen_humic.riv',
        fit: BoxFit.cover,
      ),
    );
  }
}

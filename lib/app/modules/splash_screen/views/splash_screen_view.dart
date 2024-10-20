import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:humic/app/modules/navigation_bar/views/navigation_bar_view.dart';
import 'package:humic/app/routes/app_pages.dart';
import 'package:rive/rive.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';

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
    // Scaffold(
    //   backgroundColor: const Color(0xFFC5181F),
    //   body: Center(
    //     child: Obx(() => AnimatedContainer(
    //           width: controller.width.value,
    //           height: controller.height.value,
    //           decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.circular(
    //                 controller.borderRadius.value)
    //           ),
    //           duration: const Duration(seconds: 1),
    //           curve: Curves.easeOutCirc,
    //          child: Padding(
    //             padding: const EdgeInsets.all(16.0),
    //             child: AnimatedSwitcher(
    //               duration: const Duration(seconds: 1), // Durasi transisi logo
    //               child: Image.asset(
    //                 controller.logo.value, // Dynamic image
    //                 scale: 4,
    //               ),
    //               transitionBuilder: (Widget child, Animation<double> animation) {
    //                 return FadeTransition(
    //                   opacity: animation,
    //                   child: child,
    //                 );
    //               },
    //             ),
    //           ),
    //         )),
    //   ),
    // );
  }
}

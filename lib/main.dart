import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:rive/rive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RiveFile.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => GetMaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     useInheritedMediaQuery: true,
    //     locale: DevicePreview.locale(context),
    //     builder: DevicePreview.appBuilder,
    //     title: "Application",
    //     initialRoute: Routes.SPLASH_SCREEN,
    //     getPages: AppPages.routes,
    //   ),
    // ),
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: Routes.SPLASH_SCREEN,
        getPages: AppPages.routes,
      ),
  );
}

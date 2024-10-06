import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  var width = 110.0.obs;
  var height = 110.0.obs;
  var borderRadius = 55.0.obs;
  var logo =
      'assets/images/logo_untitled.png'.obs; // Observable buat radius container

  @override
  void onInit() {
    super.onInit();

    // Nge-delay 3 detik, lalu expand ke full screen dengan border radius mengecil
    Future.delayed(Duration(seconds: 3), () {
      width.value = Get.width;
      height.value = Get.height;
      borderRadius.value = 0.0;
      logo.value = 'assets/images/logo.png'; // Radius berubah jadi 0, biar jadi kotak full
    });
  }
}

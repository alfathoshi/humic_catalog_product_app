import 'package:get/get.dart';

import 'package:humic/app/modules/catalog/bindings/catalog_binding.dart';
import 'package:humic/app/modules/catalog/views/catalog_view.dart';
import 'package:humic/app/modules/catalog_detail/bindings/catalog_detail_binding.dart';
import 'package:humic/app/modules/catalog_detail/views/catalog_detail_view.dart';
import 'package:humic/app/modules/home/bindings/home_binding.dart';
import 'package:humic/app/modules/home/views/home_view.dart';
import 'package:humic/app/modules/navigation_bar/bindings/navigation_bar_binding.dart';
import 'package:humic/app/modules/navigation_bar/views/navigation_bar_view.dart';
import 'package:humic/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:humic/app/modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION_BAR,
      page: () => NavigationBarView(),
      binding: NavigationBarBinding(),
    ),
    GetPage(
      name: _Paths.CATALOG,
      page: () =>  CatalogView(),
      binding: CatalogBinding(),
    ),
    GetPage(
      name: _Paths.CATALOG_DETAIL,
      page: () =>  CatalogDetailView(),
      binding: CatalogDetailBinding(),
    ),
  ];
}

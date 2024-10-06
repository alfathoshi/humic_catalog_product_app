import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:humic/app/modules/catalog/views/catalog_view.dart';
import 'package:humic/app/modules/home/views/home_view.dart';
import 'package:humic/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/navigation_bar_controller.dart';

class NavigationBarView extends GetView<NavigationBarController> {
  final List<Widget> _pages = [
    HomeView(),
    CatalogView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.selectedindex.value,
            children: _pages,
          )),
      bottomNavigationBar: Obx(
        () => SizedBox(
          height: 70,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
            ),
            child: BottomNavigationBar(
              elevation: 10,
              backgroundColor: Color(0xFFC5181F),
              currentIndex: controller.selectedindex.value,
              showUnselectedLabels: false,
              onTap: (index) {
                controller.changeIndex(index);
              },
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(FluentIcons.home_12_regular), label: 'Beranda'),
                BottomNavigationBarItem(
                    icon: Icon(FluentIcons.line_horizontal_3_20_regular),
                    label: 'Katalog'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

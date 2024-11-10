import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic/app/modules/catalog/views/catalog_view.dart';
import 'package:humic/app/modules/home/views/home_view.dart';
import 'package:humic/app/themes/colors.dart';

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
        () => Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(
                    0.5), 
                spreadRadius: 2, 
                blurRadius: 10, 
                offset:
                    const Offset(0, 3), 
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: whiteColor,
            currentIndex: controller.selectedindex.value,
            onTap: (index) {
              controller.changeIndex(index);
            },
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FluentIcons.home_12_regular), label: 'Beranda'),
              BottomNavigationBarItem(
                  icon: Icon(FluentIcons.book_open_16_filled),
                  label: 'Katalog'),
            ],
          ),
        ),
      ),
    );
  }
}

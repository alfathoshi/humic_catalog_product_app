import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalogController extends GetxController {
  var catalog = <Map<dynamic, dynamic>>[].obs;
  var filteredCatalog = <Map<dynamic, dynamic>>[].obs;
  var isLoading = true.obs;
  var pageController = PageController(viewportFraction: 0.85);

  @override
  void onInit() {
    super.onInit();
    fetchDataList();
  }

  Future<List<Map<dynamic, dynamic>>> fetchDataList() async {
    try {
      final DatabaseReference ref =
          FirebaseDatabase.instance.ref().child("catalogs");
      final DataSnapshot snapshot = await ref.get();

      if (snapshot.exists) {
        catalog.clear();
        filteredCatalog.clear();

        for (var child in snapshot.children) {
          catalog.add(Map<String, dynamic>.from(child.value as Map));
          filteredCatalog.add(Map<String, dynamic>.from(child.value as Map));
        }
        pageController.jumpToPage(0);
      }
      return catalog;
    } finally {
      isLoading.value = false;
    }
  }

  void searchCatalog(String query) {
    if (query.isEmpty) {
      filteredCatalog.assignAll(catalog);
    } else {
      filteredCatalog.assignAll(
        catalog.where((item) {
          final name = item['name']?.toLowerCase() ?? '';
          return name.contains(query.toLowerCase());
        }).toList(),
      );
    }
  }
}

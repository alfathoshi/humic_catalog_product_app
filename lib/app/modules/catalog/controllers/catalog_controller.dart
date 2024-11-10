import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CatalogController extends GetxController {
  var catalog = <Map<dynamic, dynamic>>[].obs;
  var filteredCatalog = <Map<dynamic, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDataList();
  }

  Future<List<Map<dynamic, dynamic>>> fetchDataList() async {
    final DatabaseReference ref =
        FirebaseDatabase.instance.ref().child("catalogs");
    final DataSnapshot snapshot = await ref.get();
    if (snapshot.exists) {
      for (var child in snapshot.children) {
        catalog.add(Map<String, dynamic>.from(child.value as Map));
        filteredCatalog.add(Map<String, dynamic>.from(child.value as Map));
      }
    }
    return catalog;
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

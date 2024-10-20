import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CatalogController extends GetxController {
  var pdfUrl = ''.obs; // Observable string buat nyimpan URL PDF

  // Fungsi buat fetch PDF dari Firebase
  Future<void> loadPdf(String fileName) async {
  try {
    final storageRef = FirebaseStorage.instance.ref();
    final fileRef = storageRef.child('pdfs/$fileName');

    // Ambil URL download
    String downloadURL = await fileRef.getDownloadURL();
    
    if (downloadURL.isEmpty) {
      throw Exception("Download URL is empty.");
    }
    
    pdfUrl.value = downloadURL;
    Get.toNamed('/pdfViewer'); // Navigasi ke viewer setelah URL siap
  } catch (e) {
    Get.snackbar('Error', 'Gagal load PDF: $e');
  }
}
}

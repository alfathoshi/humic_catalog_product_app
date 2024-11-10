import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class CatalogDetailController extends GetxController {
  final pdfUrl = Get.arguments as String;

  Future<PDFDocument> loadPdf(String pdfUrl) async {
    PDFDocument doc = await PDFDocument.fromURL(pdfUrl);
    return doc;
  }

  @override
  void onInit() {
    super.onInit();
    loadPdf(pdfUrl);
  }
}

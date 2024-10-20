import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class CatalogDetailController extends GetxController {
  var doc = PDFDocument();

  Future<String> getPdfUrl() async {
    try {
      // Path ke file PDF di Firebase Storage
      String filePath = 'report3rd.pdf';
      
      // Ambil URL download dari Firebase Storage
      String downloadUrl = await FirebaseStorage.instance.ref(filePath).getDownloadURL();
      
      return downloadUrl;
    } catch (e) {
      print('Error fetching PDF URL: $e');
      throw e;
    }
  }

   Future<PDFDocument> loadPdf() async {
     String pdfUrl = await getPdfUrl();
    PDFDocument doc = await PDFDocument.fromURL(pdfUrl);
    return doc;
  }

  @override
  void onInit() {
    super.onInit();
    loadPdf();
  }
}

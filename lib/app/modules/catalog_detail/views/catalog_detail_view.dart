import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic/app/themes/colors.dart';
import 'package:humic/app/widgets/appbar.dart';
import '../controllers/catalog_detail_controller.dart';

class CatalogDetailView extends GetView<CatalogDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
      ),
      body: FutureBuilder<PDFDocument>(
        future: controller.loadPdf(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); 
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); 
          } else if (snapshot.hasData) {
            PDFDocument doc = snapshot.data!;
            return PDFViewer(document: doc); // Tampilin PDF
          } else {
            return const Center(child: Text('No PDF found.'));
          }
        },
      ),
    );
  }
}

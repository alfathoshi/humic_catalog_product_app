import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic/app/themes/colors.dart';
import 'package:humic/app/themes/fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../controllers/catalog_detail_controller.dart';

class CatalogDetailView extends GetView<CatalogDetailController> {
  final pdfUrl = Get.arguments;
  final PdfViewerController _pdfController = PdfViewerController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: grey2Color,
        appBar: AppBar(
          foregroundColor: whiteColor,
          title: Text(
            pdfUrl['name'].toString(),
            style: h5Bold.copyWith(color: whiteColor),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffAE1717),
        ),
        body: Column(
          children: [
            Expanded(
              child: SfPdfViewer.network(
                pdfUrl['pdf'].toString(),
                controller: _pdfController,
                scrollDirection: PdfScrollDirection.horizontal,
                pageLayoutMode: PdfPageLayoutMode.single,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Color(0xffAE1717),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.first_page,
                      color: whiteColor,
                    ),
                    onPressed: () {
                      _pdfController.jumpToPage(1);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: whiteColor,
                    ),
                    onPressed: () {
                      _pdfController.previousPage();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: whiteColor,
                    ),
                    onPressed: () {
                      _pdfController.nextPage();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.last_page,
                      color: whiteColor,
                    ),
                    onPressed: () {
                      _pdfController.jumpToPage(_pdfController.pageCount);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

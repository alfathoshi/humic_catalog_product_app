import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:humic/app/routes/app_pages.dart';
import 'package:humic/app/themes/colors.dart';
import 'package:humic/app/themes/fonts.dart';
import 'package:humic/app/themes/separator.dart';
import 'package:humic/app/widgets/appbar.dart';
import 'package:humic/app/widgets/product_catalog_card.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/catalog_controller.dart';

class CatalogView extends GetView<CatalogController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CatalogController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          toolbarHeight: 90,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_searchbox.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: TextField(
                  onChanged: controller.searchCatalog,
                  decoration: InputDecoration(
                    hintText: 'Cari produk digital...',
                    hintStyle: h5RegularHint,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                'assets/images/bg_catalog.png',
                scale: 4,
              ),
              Column(
                children: [
                  sizedBox24,
                  sizedBox24,
                  Obx(() {
                    if (controller.filteredCatalog.isEmpty) {
                      return const Center(
                          child: Text("No matching products found"));
                    }
                    return SizedBox(
                      height: 620,
                      child: PageView.builder(
                        controller: PageController(viewportFraction: 0.85),
                        itemCount: controller.filteredCatalog.length,
                        itemBuilder: (context, index) {
                          final product = controller.filteredCatalog[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ProductCatalogCard(
                              product: product['name'],
                              description: product['description'],
                              onTap: () {
                                Get.toNamed(Routes.CATALOG_DETAIL,
                                    arguments: product['pdf']);
                              },
                              image: product['image'],
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

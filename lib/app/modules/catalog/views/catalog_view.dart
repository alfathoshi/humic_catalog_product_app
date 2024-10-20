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
  final List<String> produk = [
    'assets/images/stethoscope.png',
    'assets/images/sihedaf.png',
    'assets/images/anthropometry.png',
    'assets/images/amons.png',
  ];
  final List<String> desc = [
    'A digital stethoscope is an innovative tool used to visually observe heart sounds without the need to rely on the sense of hearing. It focuses on utilizing sound signals specifically to detect heart valve disease.',
    'SiHEDAF functions as an Atrial Fibrillation (AF) detector based on Photoplethysmograph (PPG) signal. AF occurrence statistics can be used as an indication of stroke risk in patients.',
    'Anthropometry Kit is a series of tools that function to detect stunting in children through measuring body weight, length and height as well as upper arm and head circumference.',
    'AMons is a portable ECG device equipped with AI-based detection algorithms for near real-time detection and alerting of various arrhythmias, offering a solution for monitoring and timely intervention in heart conditions that may otherwise go undetected.'
  ];
  final List<String> link = [
    'https://dev-katakatalog.pantheonsite.io/#dearflip-df_346/1/',
    'https://dev-katakatalog.pantheonsite.io/#dearflip-df_329/1/',
    'https://dev-katakatalog.pantheonsite.io/#dearflip-df_364/1/',
    'https://dev-katakatalog.pantheonsite.io/#dearflip-df_303/1/'
  ];
  @override
  Widget build(BuildContext context) {
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
                  SizedBox(
                    height: 620,
                    width: double.infinity,
                    child: PageView.builder(
                      controller: PageController(viewportFraction: 0.85),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ProductCatalogCard(
                            product: produk[index],
                            description: desc[index],
                            onTap: () {
                              Get.toNamed(Routes.CATALOG_DETAIL);
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

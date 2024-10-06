import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:humic/app/themes/colors.dart';
import 'package:humic/app/themes/fonts.dart';
import 'package:humic/app/themes/separator.dart';
import 'package:humic/app/widgets/appbar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: appbar,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Image.asset(
                      'assets/images/header.png',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('RC HUMIC', style: h4BoldWhite),
                          Text(
                            'CATALOG',
                            style: h6BoldPrimary,
                          ),
                          sizedBox8,
                          Text(
                            'Research Center HUMIC',
                            style: h7MediumWhite,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                sizedBox16,
                Text(
                  'RC HUMIC',
                  style: h4BoldPrimary,
                ),
                sizedBox16,
                Text(
                  'HUMIC research center focuses on technology engineering that related with human daily activities support. We are interested in develop of wearable devices and sensors that are integrated with humans body. On the science field, we are also interested with collecting the data and information about human body activities. From the data and information we could use Big Data concept to create knowledge and accurate information.',
                  textAlign: TextAlign.center,
                  style: h6Regular,
                ),
                sizedBox24,
                Text(
                  'RC HUMIC Focused',
                  style: h2BoldPrimary,
                ),
                sizedBox8,
                Image.asset(
                  'assets/images/rc_focus.png',
                  scale: 4,
                ),
                sizedBox24,
                Text(
                  'Devices & Sensors',
                  style: h2Bold,
                ),
                sizedBox16,
                Text(
                  'Engineering using devices and sensors to support human daily activities',
                  textAlign: TextAlign.center,
                  style: h4MediumPrimary,
                )
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:humic/app/themes/colors.dart';
import 'package:humic/app/themes/fonts.dart';
import 'package:humic/app/themes/separator.dart';
import 'package:humic/app/widgets/appbar.dart';
import 'package:humic/app/widgets/focused_card.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final List<String> image = [
    'assets/images/rc_focus.png',
    'assets/images/rc_focus2.png',
    'assets/images/rc_focus3.png',
  ];

  final List<String> focused = [
    'Devices & Sensors',
    'Internet of Things',
    'Big Data'
  ];

  final List<String> desc = [
    'Engineering using devices and sensors to support human daily activities',
    'Engineering using devices and sensors to support human daily activities',
    'Engineering using devices and sensors to support human daily activities'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/bg_up.png',
                      ),
                      Image.asset(
                        'assets/images/bg_down.png',
                      ),
                    ],
                  ),
                  Positioned(
                    top: 20,
                    left: 120,
                    right: 0,
                    child: Image.asset(
                      'assets/images/header.png',
                      scale: 6,
                    ),
                  ),
                  Positioned(
                    bottom: 230,
                    left: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'RC HUMIC',
                          style: h2Bold,
                        ),
                        sizedBox24,
                        Text(
                          'HUMIC research center focuses on \ntechnology engineering that related \nwith human daily activities support. We \nare interested in develop of wearable \ndevices and sensors that are integrated \nwith humans body. On the science field, \nwe are also interested with collecting \nthe data and information about human \nbody activities. From the data and \ninformation we could use Big Data \nconcept to create knowledge and \naccurate information.',
                          textAlign: TextAlign.left,
                          style: h6Regular,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff480909),
                      Color(0xffAE1717),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Text(
                        'RC HUMIC Focused',
                        style: h2BoldWhite,
                      ),
                      sizedBox24,
                      SizedBox(
                        height: 600,
                        width: double.infinity,
                        child: PageView.builder(
                          controller: PageController(
                              viewportFraction:
                                  0.85), 
                          itemCount: 3, 
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8), 
                              child: FocusedCard(
                                image: image[index],
                                focused: focused[index],
                                desc: desc[index],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

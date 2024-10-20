import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:humic/app/themes/colors.dart';
import 'package:humic/app/themes/fonts.dart';
import 'package:humic/app/themes/separator.dart';
import 'package:humic/app/widgets/appbar.dart';
import 'package:humic/app/widgets/dashboard.dart';
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

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Dashboard(),
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
                          controller: PageController(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
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

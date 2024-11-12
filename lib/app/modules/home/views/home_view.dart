import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:humic/app/themes/colors.dart';
import 'package:humic/app/themes/fonts.dart';
import 'package:humic/app/themes/separator.dart';
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
    'Internet of Things become an inevitable trending technology',
    'Using Big Data concept to gain knowledge and useful information'
  ];

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        SystemNavigator.pop();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: whiteColor,
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
                    padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                    child: Column(
                      children: [
                        Text(
                          'RC HUMIC Focused',
                          style: h2BoldWhite,
                        ),
                        sizedBox24,
                        SizedBox(
                          height: 500,
                          width: double.infinity,
                          child: PageView.builder(
                            controller: PageController(viewportFraction: 0.7),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
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
      ),
    );
  }
}

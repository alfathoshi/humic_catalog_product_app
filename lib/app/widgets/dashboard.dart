import 'package:flutter/material.dart';
import 'package:humic/app/themes/fonts.dart';
import 'package:humic/app/themes/separator.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}

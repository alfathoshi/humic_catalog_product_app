import 'package:flutter/material.dart';
import 'package:humic/app/themes/fonts.dart';
import 'package:humic/app/themes/separator.dart';

class FocusedCard extends StatelessWidget {
  final String image;
  final String focused;
  final String desc;

  const FocusedCard(
      {super.key,
      required this.image,
      required this.focused,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          scale: 4,
        ),
        sizedBox24,
        Text(
          focused,
          style: h2BoldWhite,
        ),
        sizedBox16,
        Text(
          desc,
          textAlign: TextAlign.center,
          style: h4MediumWhite,
        )
      ],
    );
  }
}

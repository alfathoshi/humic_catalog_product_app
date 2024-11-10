import 'package:flutter/material.dart';
import 'package:humic/app/themes/colors.dart';
import 'package:humic/app/themes/fonts.dart';
import 'package:humic/app/themes/separator.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductCatalogCard extends StatelessWidget {
  final String product;
  final String description;
  final VoidCallback onTap;
  final String image;
  const ProductCatalogCard({
    super.key,
    required this.product,
    required this.description,
    required this.onTap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          product,
          style: h3Bold,
        ),
        sizedBox24,
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/bg_product.png',
              fit: BoxFit.cover,
            ),
            ClipOval(
              child: Image.network(
                image,
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        sizedBox24,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              description,
              style: h6SemiBold.copyWith(fontSize: 12),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        SizedBox(
          width: 300,
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: whiteColor,
              textStyle: h4SemiBoldPrime,
              foregroundColor: primaryColor,
              side: BorderSide(color: primaryColor),
            ),
            child: const Text('Read More'),
          ),
        ),
      ],
    );
  }
}

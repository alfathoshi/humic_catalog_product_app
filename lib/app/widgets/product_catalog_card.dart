import 'package:flutter/material.dart';
import 'package:humic/app/themes/colors.dart';
import 'package:humic/app/themes/fonts.dart';
import 'package:humic/app/themes/separator.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductCatalogCard extends StatelessWidget {
  final String product;
  final String description;
  final VoidCallback onTap;
  const ProductCatalogCard({
    super.key,
    required this.product,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 620,
      ),
      child: SizedBox(
        width: 366,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/bg_product.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  product,
                  scale: 4,
                ),
              ],
            ),
            sizedBox24,
            Expanded(
              child: Text(
                description,
                style: h5SemiBold,
                textAlign: TextAlign.justify,
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
        ),
      ),
    );
  }
}

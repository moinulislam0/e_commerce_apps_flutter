import 'package:e_commerce_project/ui/screen/products_list.dart';
import 'package:e_commerce_project/ui/utils/apps_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories_card extends StatelessWidget {
  const Categories_card({
    super.key,
    required this.text,
    required this.iconData,
  });

  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ProductsList());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColors.withAlpha(75),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Icon(
                iconData,
                size: 25,
                color: primaryColors,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              letterSpacing: 0.6,
              color: primaryColors,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

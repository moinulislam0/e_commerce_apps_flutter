import 'package:e_commerce_project/ui/utils/apps_color.dart';
import 'package:flutter/material.dart';

class Remakerslistwidget extends StatelessWidget {
  const Remakerslistwidget(
      {super.key, required this.text, required this.text2, required this.onTap});
  final String text;
  final String text2;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: textStyle.copyWith(fontSize: 20),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: textStyle.copyWith(color: primaryColors, fontSize: 16),
          ),
        )
      ],
    );
  }
}

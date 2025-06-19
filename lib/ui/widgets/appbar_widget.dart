import 'package:e_commerce_project/ui/utils/apps_color.dart';
import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {

  const AppbarWidget({super.key, required this.IconsData, required this.onTap});
  final IconData IconsData;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      splashColor: primaryColors.withRed(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: CircleAvatar(
          backgroundColor: greyColor,
          radius: 18,
          child: Icon(
            IconsData,
            size: 18,
          ),
        ),
      ),
    );
  }
}

import 'package:e_commerce_project/ui/utils/apps_color.dart';
import 'package:flutter/material.dart';

class CommonElevatedbutton extends StatelessWidget {
  const CommonElevatedbutton(
      {super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColors,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Text(
            text,
            style: TextStyle(color: Colors.white, letterSpacing: 0.6),
          )),
    );
  }
}

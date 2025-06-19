import 'package:e_commerce_project/ui/utils/apps_color.dart';
import 'package:flutter/material.dart';

class CommonTextfield extends StatelessWidget {
  const CommonTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.validator});
  final TextEditingController controller;
  final String? hintText;
  final Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(),
      validator: (value) => validator(value),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: softGrey),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: primaryColors)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: primaryColors))),
    );
  }
}

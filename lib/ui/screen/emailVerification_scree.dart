import 'package:e_commerce_project/ui/api_controller/user_auth_controller.dart';
import 'package:e_commerce_project/ui/screen/Otp_screen.dart';
import 'package:e_commerce_project/ui/utils/apps_color.dart';
import 'package:e_commerce_project/ui/widgets/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificaitionScreen extends StatefulWidget {
  const EmailVerificaitionScreen({super.key});

  @override
  State<EmailVerificaitionScreen> createState() =>
      _EmailVerificaitionScreenState();
}

class _EmailVerificaitionScreenState extends State<EmailVerificaitionScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<UserAuthController>(builder: (authController) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Welcome Back",
                style: TextStyle(
                    color: black, fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Please Enter Your email Address",
                style: TextStyle(
                  color: softGrey,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CommonTextfield(
                  controller: _emailController,
                  hintText: "Email Adress",
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    return null;
                  }),
              SizedBox(
                height: 5,
              ),
              authController.emailVerificationIndecator
                  ? CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              final bool response = await authController
                                  .emialVerification(_emailController.text);
                              if (response) {
                                Get.to(OtpScreen(email: _emailController.text));
                              } else {
                                Get.snackbar("failed", 'Please try again',
                                    snackPosition: SnackPosition.BOTTOM);
                              }
                            }
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(color: Colors.white),
                          ))) //this design to theme,maid.dart
            ],
          ),
        ),
      );
    }));
  }
}

import 'package:e_commerce_project/ui/api_controller/auth_controller.dart';
import 'package:e_commerce_project/ui/api_controller/user_auth_controller.dart';
import 'package:e_commerce_project/ui/screen/home_screen.dart';
import 'package:e_commerce_project/ui/utils/apps_color.dart';
import 'package:e_commerce_project/ui/widgets/common_elevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserAuthController>(builder: (userauthController) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
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
                "Enter OTP code",
                style: TextStyle(
                    color: black, fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "A 4 digit OTP code has been sent",
                style: TextStyle(
                  color: softGrey,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              PinCodeTextField(
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    activeColor: Colors.green,
                    selectedColor: primaryColors,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    inactiveColor: greyColor),
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                controller: _otpController,
                onCompleted: (v) {},
                onChanged: (value) {},
                appContext: context,
              ),
              SizedBox(
                height: 5,
              ),
              CommonElevatedbutton(
                  text: "Next",
                  onTap: () async {
                    final bool response = await userauthController.otpVerification(
                        widget.email, _otpController.text);
                    if (response) {
                      
         
                      Get.offAll(HomeScreen());
                    } else {
                      Get.snackbar("Failed", "Try again",
                          snackPosition: SnackPosition.BOTTOM,
                          duration: Duration(seconds: 3));
                    }
                  }),
              SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: greyColor),
                      text: "This code will be expire in ",
                      children: [
                    TextSpan(
                        style: TextStyle(color: primaryColors), text: "120s")
                  ])),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Resend Code",
                    style: TextStyle(color: greyColor),
                  ))
            ],
          ),
        );
      }),
    );
  }
}

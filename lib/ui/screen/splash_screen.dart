import 'package:e_commerce_project/ui/screen/bottom_nav_bar.dart';
import 'package:e_commerce_project/ui/utils/apps_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) async {
      // final bool loginState = await Get.find<AuthController>().isLoggedIn();
      // if (loginState) {
      //   Get.off(HomeScreen());
      // } else {
      //   Get.off(EmailVerificaitionScreen());
      // }
      Get.offAll(BottomNavBar());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 500,
          ),
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    color: primaryColors,
                  )),
              Text("Version 1.0", style: TextStyle(color: greyColor))
            ],
          ),
        )
      ],
    ));
  }
}

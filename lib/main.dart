import 'package:e_commerce_project/ui/Controller/BottomNavigationController.dart';
import 'package:e_commerce_project/ui/api_controller/auth_controller.dart';
import 'package:e_commerce_project/ui/api_controller/home_controller.dart';
import 'package:e_commerce_project/ui/api_controller/profile_data_controller.dart';
import 'package:e_commerce_project/ui/api_controller/user_auth_controller.dart';
import 'package:e_commerce_project/ui/screen/splash_screen.dart';
import 'package:e_commerce_project/ui/utils/apps_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GetxBindings(),
      title: "E-Commerce_project",
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))))),
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              color: Colors.white,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColors,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))))),
    );
  }
}

// class GetxBindings extends Bindings {
//   @override
//   void dependencies() {
//     Get.create(()=>BottomNavigationController());
//   }
// }
class GetxBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavigationController());
    Get.put(UserAuthController());
    Get.put(AuthController());
    Get.put(UserprofileController());
    Get.put(HomeController());
   
  }
}

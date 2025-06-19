import 'package:e_commerce_project/ui/Controller/BottomNavigationController.dart';
import 'package:e_commerce_project/ui/api_controller/home_controller.dart';
import 'package:e_commerce_project/ui/screen/cart_screen.dart';
import 'package:e_commerce_project/ui/screen/category_screen.dart';
import 'package:e_commerce_project/ui/screen/home_screen.dart';
import 'package:e_commerce_project/ui/screen/wish_list_screen.dart';
import 'package:e_commerce_project/ui/utils/apps_color.dart';
import 'package:e_commerce_project/ui/widgets/carusel_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> screen = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishListScreen()
  ];
  @override
  void initState() {
    super.initState();
    Get.find<HomeController>().getSlider();
  }

  // BottomNavigationController _navigationController =
  //     Get.put(BottomNavigationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavigationController>(builder: (controller) {
        return screen[controller.SelectedIndex];
      }),
      bottomNavigationBar:
          GetBuilder<BottomNavigationController>(builder: (controller) {
        return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 5,
            currentIndex: controller.SelectedIndex,
            showUnselectedLabels: true,
            selectedItemColor: primaryColors,
            unselectedItemColor: greyColor,
            showSelectedLabels: true,
            onTap: (value) {
              controller.changeIndex(value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline), label: 'WishList')
            ]);
      }),
    );
  }
}

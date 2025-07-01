import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_project/ui/Controller/BottomNavigationController.dart';
import 'package:e_commerce_project/ui/api_controller/auth_controller.dart';
import 'package:e_commerce_project/ui/api_controller/home_controller.dart';
import 'package:e_commerce_project/ui/screen/Profile_screen.dart';
import 'package:e_commerce_project/ui/screen/emailVerification_scree.dart';
import 'package:e_commerce_project/ui/utils/apps_color.dart';
import 'package:e_commerce_project/ui/widgets/Categories_card/card.dart';
import 'package:e_commerce_project/ui/widgets/Product_card/card.dart';
import 'package:e_commerce_project/ui/widgets/appbar_widget.dart';
import 'package:e_commerce_project/ui/widgets/carusel_widget.dart';
import 'package:e_commerce_project/ui/widgets/home/remakersListWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/logo_nav.png'),
            Spacer(),
            AppbarWidget(
                IconsData: Icons.person_outline,
                onTap: () {
                  Get.find<AuthController>().isLoggedIn().then((value) {
                    if (value) {
                      Get.to(ProfileScreen());
                    } else {
                      Get.to(EmailVerificaitionScreen());
                    }
                  });
                }),
            SizedBox(
              width: 10,
            ),
            AppbarWidget(IconsData: Icons.phone_outlined, onTap: () {}),
            SizedBox(
              width: 10,
            ),
            AppbarWidget(IconsData: Icons.notifications_outlined, onTap: () {})
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {},
                decoration: InputDecoration(
                    hintText: "Search",
                    fillColor: const Color.fromARGB(255, 217, 221, 221),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    prefixIcon: Icon(Icons.search_outlined),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(height: 10),
              GetBuilder<HomeController>(builder: (homeSliderController) {
                if (homeSliderController.sliderIndecator) {
                  return CircularProgressIndicator();
                }
                return CaruselWidget(
                  homeshomeslidersModel: homeSliderController.homeSliderModel,
                );
              }),
              SizedBox(height: 10),
              Remakerslistwidget(
                  text: "Categories",
                  text2: "Sell All",
                  onTap: () {
                    Get.find<BottomNavigationController>().changeIndex(1);
                  }),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Categories_card(
                        text: "Computer", iconData: Icons.computer_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Categories_card(
                        text: "Electronics",
                        iconData: Icons.electric_scooter_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Categories_card(
                        text: "Clothes", iconData: Icons.collections_rounded),
                    SizedBox(
                      width: 10,
                    ),
                    Categories_card(
                        text: "Shoe", iconData: Icons.shopping_basket_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Categories_card(
                        text: "Computer", iconData: Icons.computer_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Categories_card(
                        text: "Computer", iconData: Icons.computer_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Categories_card(
                        text: "Computer", iconData: Icons.computer_outlined),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Remakerslistwidget(
                  text: "Popular", text2: "See All", onTap: () {}),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  Product_card(),
                  Product_card(),
                  Product_card(),
                  Product_card(),
                  Product_card(),
                ]),
              ),
              SizedBox(height: 10),
              Remakerslistwidget(
                text: "Special",
                text2: "See All",
                onTap: () {},
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Product_card(),
                      Product_card(),
                      Product_card(),
                      Product_card(),
                      Product_card(),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

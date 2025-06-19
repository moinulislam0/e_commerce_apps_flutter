import 'package:e_commerce_project/ui/Controller/BottomNavigationController.dart';
import 'package:e_commerce_project/ui/screen/products_details_screen.dart';
import 'package:e_commerce_project/ui/utils/apps_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product_card extends StatelessWidget {
  const Product_card({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigationController controller = BottomNavigationController();
    return SizedBox(
      width: 140,
      child: InkWell(
        onTap: () {
          //Get.find<BottomNavigationController>().changeIndex(2);
          Get.to(ProductsDetailsScreen());
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: primaryColors.withAlpha(75),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Container(
                  width: 140,
                  height: 70,
                  color: primaryColors, // Optional background color
                  child: Image.asset(
                    'assets/images/shoe.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("Nike Casual Shoe A3B3 "),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("\$340"),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [Icon(Icons.star), Text("4.5")],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColors),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(Icons.favorite_border_outlined),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

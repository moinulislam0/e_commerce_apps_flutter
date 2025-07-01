import 'package:e_commerce_project/ui/Controller/BottomNavigationController.dart';
import 'package:e_commerce_project/ui/api_controller/cartController.dart';

import 'package:e_commerce_project/ui/utils/apps_color.dart';
import 'package:e_commerce_project/ui/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {

  const CartScreen({super.key, });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart List"),
          leading: IconButton(
              onPressed: () {
                Get.find<BottomNavigationController>().BackToHome();
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return CartItem();//cartData:controller.model.data[]
                  }),
            ),
            Container(
              decoration: BoxDecoration(
                  color: primaryColors.withAlpha(75),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 16, top: 16, right: 8, left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text("\$24"),
                       
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        // final result = await Get.find<AuthController>()
                        //     .checkAuthValidation();
                        // if (result) {
                        //   if (_selectedSize != null &&
                        //       _colorsIndex != null) {
                        //     Get.find<Cartcontroller>().addtocart(productId,
                        //         _selectedSize, _colorsIndex.toString());
                        //   }
                        // } else {
                        //   Get.showSnackbar(GetSnackBar(
                        //     title: "selected color and size",
                        //     message: "You have no selected yet",
                        //   ));
                        // }
                      },
                      child: Container(
                        height: 35,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryColors,
                            border: Border.all(color: Colors.white)),
                        child: Center(
                            child: Text(
                          "CheckOut",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

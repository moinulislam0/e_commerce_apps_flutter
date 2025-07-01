import 'package:e_commerce_project/ui/api_controller/cartController.dart';
import 'package:e_commerce_project/ui/data/service/model/cartToList.dart';
import 'package:e_commerce_project/ui/widgets/steperCount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, });
  // final CartData cartData;
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: [
            Image.asset(
              "assets/images/shoe.png",
              width: 120,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("New Shoe the nikle"),
                            Row(
                              children: [
                                Text("Size : xl"),
                                Text("Color: Yellow")
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$100"),//${widget.cartdata.data!price}
                      steperCount(
                        ondecrement: (int currentValue) {
                          // Get.find<Cartcontroller>()
                          //     .decrementItem(widget.cartData.id!);
                        },
                        onIncrement: (int currentValue) {
                          // Get.find<Cartcontroller>().incrementItem(widget.cartData.id!);
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

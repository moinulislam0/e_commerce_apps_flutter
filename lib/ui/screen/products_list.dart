import 'package:e_commerce_project/ui/widgets/Product_card/card.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0), // Add some padding around the grid
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.7,
            // Add spacing between rows too
          ),
          itemBuilder: (context, index) {
            return SizedBox(width: double.infinity, child: Product_card());
          },
        ),
      ),
    );
  }
}

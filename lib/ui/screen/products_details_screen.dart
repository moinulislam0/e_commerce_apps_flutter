import 'package:e_commerce_project/ui/Controller/BottomNavigationController.dart';
import 'package:e_commerce_project/ui/utils/apps_color.dart';
import 'package:e_commerce_project/ui/widgets/products_view_slider/Products_view_slider.dart';
import 'package:e_commerce_project/ui/widgets/steperCount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsDetailsScreen extends StatefulWidget {
  const ProductsDetailsScreen({
    super.key,
  });

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  List<Color> colors = [
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blueAccent,
  ];
  Color _colorsIndex = const Color.fromRGBO(0, 0, 0, 1);
  List<String> sizes = ["S", "M", "X", 'Xl', "XXl"];
  String _selectedSize = "S";
  late TextEditingController stepCount;
  @override
  initState() {
    super.initState();
    stepCount = TextEditingController(text: '0');
  }

  int _currentNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Details"),
      ),
      body: GetBuilder<BottomNavigationController>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductsViewSlider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Address Casual Show s4657 Brand view"),
                          Row(
                            children: [
                              Wrap(
                                children: [Icon(Icons.star), Text("4.5")],
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Reviews",
                                    style: TextStyle(color: primaryColors),
                                  )),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: primaryColors.withAlpha(75),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    steperCount(
                      ondecrement: (int currentValue) {},
                      onIncrement: (int currentValue) {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Colors",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: colors.map((color) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        _colorsIndex = color;
                        setState(() {});
                      },
                      child: CircleAvatar(
                        backgroundColor: color,
                        radius: 20,
                        child: Visibility(
                            visible: _colorsIndex == color,
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Size",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Row(
                children: sizes.map((size) {
                  bool isSelected = size == _selectedSize;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: InkWell(
                      onTap: () {
                        _selectedSize = size;
                        setState(() {});
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(),
                          color: isSelected ? primaryColors : null,
                        ),
                        child: Visibility(
                          visible: true,
                          child: Center(
                              child: Text(size,
                                  style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black))),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Wrap(children: [
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 102, 104, 104),
                      fontSize: 14,
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 10,
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
                            "Add to Cart",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  List<String> getSize(String size) {
    return size.split(',');
  }

  List<Color> getColors(String color) {
    List<Color> hexColors = [];
    List<String> colors = color.split(',');
    for (String c in colors) {
      c = c.replaceAll('#', '0xFF');
      hexColors.add(Color(int.parse(c)));
    }
    return hexColors;
  }
}

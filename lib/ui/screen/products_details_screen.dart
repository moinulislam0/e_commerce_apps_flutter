import 'package:e_commerce_project/ui/controller/BottomNavigationController.dart';
import 'package:e_commerce_project/ui/utils/apps_color.dart';
import 'package:e_commerce_project/ui/widgets/products_view_slider/Products_view_slider.dart';
import 'package:flutter/material.dart';

class ProductsDetailsScreen extends StatefulWidget {
  const ProductsDetailsScreen({super.key});

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  BottomNavigationController controller = BottomNavigationController();
  List<Color> colors = [
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blueAccent,
  ];
  Color colorsIndex = const Color.fromRGBO(0, 0, 0, 1);
  List<String> sizes = ["S", "M", "X", 'Xl', "XXl"];
  String selectedSize = "S";
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
      body: SingleChildScrollView(
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primaryColors.withAlpha(75)),
                          child: IconButton(
                              onPressed: () {
                                //controller.increment();

                                if (_currentNumber < 20) {
                                  _currentNumber++;
                                  stepCount.text = _currentNumber.toString();
                                  //setState(() {});
                                }
                              },
                              icon: Icon(Icons.add))),
                      SizedBox(
                        width: 10,
                      ),
                      // Obx(
                      //   () => Text(controller.numberCount.toString()),
                      // ),
                      SizedBox(
                        width: 44,
                        child: TextField(
                          controller: stepCount,
                          enabled: false,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primaryColors.withAlpha(75)),
                          child: IconButton(
                              onPressed: () {
                                if (_currentNumber > 0) {
                                  _currentNumber--;

                                  stepCount.text = _currentNumber.toString();
                                  //setState(() {});
                                }
                                //controller.decrement();
                              },
                              icon: Icon(Icons.remove)))
                    ],
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
                      colorsIndex = color;
                      setState(() {});
                    },
                    child: CircleAvatar(
                      backgroundColor: color,
                      radius: 20,
                      child: Visibility(
                          visible: colorsIndex == color,
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
                bool isSelected = size == selectedSize;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: () {
                      selectedSize = size;
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
                      onTap: () {},
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
      ),
    );
  }
}

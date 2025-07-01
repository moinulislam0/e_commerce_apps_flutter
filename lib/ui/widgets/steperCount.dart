import 'package:e_commerce_project/ui/Controller/BottomNavigationController.dart';
import 'package:e_commerce_project/ui/utils/apps_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class steperCount extends StatefulWidget {
  final Function(int currentValue) ondecrement, onIncrement;

  const steperCount(
      {super.key, required this.ondecrement, required this.onIncrement});
  @override
  _steperCountState createState() => _steperCountState();
}

class _steperCountState extends State<steperCount> {
  TextEditingController stepCount = TextEditingController();
  int _currentNumber = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<BottomNavigationController>(builder: (controller) {
      return Row(
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
                    // controller.increment();

                    if (_currentNumber < 20) {
                      _currentNumber++;
                      stepCount.text = _currentNumber.toString();
                      widget.onIncrement(_currentNumber);
                      // setState(() {});

                      //
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
                      widget.ondecrement(_currentNumber);
                      stepCount.text = _currentNumber.toString();

                      //setState(() {});
                    }
                    // controller.decrement();
                    // setState(() {});
                  },
                  icon: Icon(Icons.remove)))
        ],
      );
    });
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_project/ui/data/service/model/HomeSliders_model.dart';
import 'package:flutter/material.dart';

class CaruselWidget extends StatefulWidget {
  final HomeSliderData homesslidersModel;
  const CaruselWidget({
    super.key,
    required this.homesslidersModel,
  });

  @override
  State<CaruselWidget> createState() => _CaruselWidgetState();
}

class _CaruselWidgetState extends State<CaruselWidget> {
  ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            viewportFraction: 1,
            initialPage: 0,
            autoPlay: true,
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            //widget.homeslidersModel.data?
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                    // image: DecorationImage(
                    //     image: NetworkImage(sliders.image ?? '0'))
                  ),
                  child: Center(
                    child: Text("text ${i}"),
                  ),
                );
              },
            );
          }).toList(),
        ),
        ValueListenableBuilder<int>(
          valueListenable: _currentIndex,
          builder: (context, currentIndex, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (i) {
                //widget.homeslidersModel.data?.length ?? 0
                //we can change the number of value 5  and this position we can stay above code;
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: currentIndex == i ? Colors.blue : null,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ],
    );
  }
}

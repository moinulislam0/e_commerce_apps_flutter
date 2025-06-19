import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  int _SelectedIndex = 0;
  RxInt numberCount = 0.obs;
  int get SelectedIndex => _SelectedIndex;


  
  void changeIndex(int index) {
    _SelectedIndex = index;
    update();
  }

  void BackToHome() {
    if (SelectedIndex != 0) {
      _SelectedIndex = 0;
      update();
    }
  }

  void increment() {
    if (numberCount < 20) {
      numberCount++;
    }
  }

  void decrement() {
    if (numberCount > 0) {
      numberCount--;
    }
  }
}

import 'package:e_commerce_project/ui/data/service/model/HomeSliders_model.dart';
import 'package:e_commerce_project/ui/data/service/network.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static bool _sliderIndecator = false;
  static HomeSliderData _homeslidersModel = HomeSliderData();
  bool get sliderIndecator => _sliderIndecator;
  HomeSliderData get homeSliderModel => _homeslidersModel;
  Future<bool> getSlider() async {
    _sliderIndecator = true;
    final reponse = await Network.getRequest(url: '/ListProductSlider');
    _sliderIndecator = false;
    if (reponse.isSuccess) {
      _homeslidersModel = HomeSliderData.fromJson(reponse.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}

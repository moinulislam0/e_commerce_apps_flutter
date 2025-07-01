import 'package:e_commerce_project/ui/data/service/model/Category_model.dart';
import 'package:e_commerce_project/ui/data/service/network.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  bool _categoryIndecator = false;
  bool get categoryIndecator => _categoryIndecator;

  static CategoryModelData _categoryModelData = CategoryModelData();
  static CategoryModelData get categoryModelData => _categoryModelData;

  Future<bool> getCategory() async {
    _categoryIndecator = true;
    update();
    final response = await Network.getRequest(url: "/categorySlider");
    _categoryIndecator = false;
    if (response.isSuccess) {
      _categoryModelData = CategoryModelData.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}

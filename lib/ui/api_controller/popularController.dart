import 'package:e_commerce_project/ui/data/service/model/productPopularModel.dart';
import 'package:e_commerce_project/ui/data/service/network.dart';
import 'package:get/get.dart';

class Popularcontroller extends GetxController {
  bool _popularIndecator = false;
  Productpopularmodel _productpopularmodel = Productpopularmodel();
  bool get popularIndecator => _popularIndecator;
  Productpopularmodel get productPopularModel => _productpopularmodel;

  Future<bool> getPopular() async {
    _popularIndecator = true;
    final response = await Network.getRequest(url: "");
    _popularIndecator = false;
    update();
    if (response.isSuccess) {
      _productpopularmodel =
          await Productpopularmodel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}

import 'package:e_commerce_project/ui/api_controller/auth_controller.dart';
import 'package:e_commerce_project/ui/data/service/model/cartToList.dart';
import 'package:e_commerce_project/ui/data/service/network.dart';
import 'package:get/get.dart';

class Cartcontroller extends GetxController {
  bool _cartIndecatorProgress = false;
  bool get cartIndecatorProgress => _cartIndecatorProgress;
  bool _cartToListProgress = false;
  bool get cartToListProgress => _cartToListProgress;
  CarttolistModel _carttolistModel = CarttolistModel();
  CarttolistModel get carttolistModel => _carttolistModel;
  int _totalPrice = 0;
  int get totalPrice => _totalPrice;
  Future<bool> addtocart(int productId, String color, String size) async {
    _cartIndecatorProgress = true;
    final response = await Network.postRequest(
        url: "/addToCart",
        body: {"productId": productId, "Color": color, "size": size});
    update();
    _cartIndecatorProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      if (response.statusCode == 401) {
        Get.find<AuthController>().logOut();
      }
      update();
      return false;
    }
  }

  Future<bool> getcartList() async {
    _cartToListProgress = true;
    final response = await Network.postRequest(url: "/addToCart");
    update();
    _cartToListProgress = false;
    if (response.isSuccess) {
      _carttolistModel = CarttolistModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  void incrementItem(int CartItem) {
    _carttolistModel.data!
        .firstWhere((element) => element.id == CartItem)
        .count++;
    updateTotalPrice();
  }

  void decrementItem(int CartItem) {
    _carttolistModel.data!
        .firstWhere((element) => element.id == CartItem)
        .count--;
    updateTotalPrice();
  }

  void updateTotalPrice() {
    for (var cart in _carttolistModel.data!) {
      _totalPrice +=
          cart.count; //(double.parse(cart.product.price?? '0'))*cart.count;
    }
    update();
  }
}

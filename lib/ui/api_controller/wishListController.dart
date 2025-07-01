import 'package:e_commerce_project/ui/api_controller/auth_controller.dart';
import 'package:e_commerce_project/ui/data/service/network.dart';
import 'package:get/get.dart';

class Wishlistcontroller extends GetxController {
  bool _wishlistprogressIndecator = false;
  bool get wishlistprogressIndecator => _wishlistprogressIndecator;

  Future<bool> addToWishList(int productid) async {
    _wishlistprogressIndecator = true;
    final reponse = await Network.getRequest(url: "/wishlist/$productid");
    _wishlistprogressIndecator = false;
    update();
    if (reponse.isSuccess) {
      update();
      return true;
    } else {
      if (reponse.statusCode == 401) {
        Get.find<AuthController>().logOut();
      }
      update();
      return false;
    }
  }
}

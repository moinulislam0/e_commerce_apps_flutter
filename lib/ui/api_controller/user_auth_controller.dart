import 'package:e_commerce_project/ui/api_controller/auth_controller.dart';
import 'package:e_commerce_project/ui/api_controller/profile_data_controller.dart';
import 'package:e_commerce_project/ui/data/service/network.dart';
import 'package:get/get.dart';

class UserAuthController extends GetxController {
  bool _emailVerificationIndecator = false;
  bool _otpVerificationIndecator = false;
  bool get emailVerificationIndecator => _emailVerificationIndecator;
  bool get otpVerificationIndecator => _otpVerificationIndecator;

  Future<bool> emialVerification(String email) async {
    _otpVerificationIndecator = true;
    update();
    final response = await Network.getRequest(url: '/UserLogin/$email');
    _otpVerificationIndecator = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> otpVerification(String email, String otp) async {
    _emailVerificationIndecator = true;
    final response = await Network.getRequest(url: '/VerifyLogin/$email/$otp');
    _emailVerificationIndecator = false;
    if (response.isSuccess) {
      Get.find<AuthController>().saveUserToken(response.returnData['data']);
      Get.find<UserprofileController>().userProfile();
      print(response.returnData['data']);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}

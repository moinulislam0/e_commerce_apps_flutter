import 'package:e_commerce_project/ui/api_controller/auth_controller.dart';
import 'package:e_commerce_project/ui/data/service/model/profile_models.dart';
import 'package:e_commerce_project/ui/data/service/network.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class UserprofileController extends GetxController {
  bool _userProfileIndecator = false;

  Future<bool> userProfile() async {
    _userProfileIndecator = true;
    update();
    final response = await Network.getRequest(url: '/ReadProfile');
    _userProfileIndecator = false;
    if (response.isSuccess) {
      final ProfileData profileData = ProfileData.fromJson(response.returnData);
      if(profileData.data != null){
        Get.find<AuthController>().saveProfileData(profileData.data!.first as ProfileData);
      }
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}

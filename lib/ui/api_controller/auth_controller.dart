import 'dart:convert';

import 'package:e_commerce_project/ui/data/service/model/profile_models.dart';
import 'package:e_commerce_project/ui/screen/emailVerification_scree.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static String? _token;
  static ProfileData? _profileData;

  static ProfileData? get profile => _profileData;
  static String? get token => _token;
  Future<bool> isLoggedIn() async {
    await getToken();
    await getProfileData();
    return _token != null;
  }

  Future<void> saveUserToken(userToken) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _token = userToken;
    await preference.setString('token', userToken);
  }

  Future<void> saveProfileData(ProfileData profile) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _profileData = profile;
    await preference.setString("user-profile", profile.toJson().toString());
  }

  Future<void> getToken() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _token = preference.getString('token');
  }

  Future<void> getProfileData() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _profileData = ProfileData.fromJson(
        jsonDecode(preference.getString('user-profile') ?? '{}'));
  }

  Future<void> clearUserData() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    await preference.clear();
    _token = null;
  }

  Future<void> logOut() async {
    clearUserData();
    await Get.to(EmailVerificaitionScreen());
  }

  Future<bool> checkAuthValidation() async{
    final authState = await Get.find<AuthController>().isLoggedIn();
    Get.to(const EmailVerificaitionScreen());
    return authState;
  }
}

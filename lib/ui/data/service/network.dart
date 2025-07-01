import 'dart:convert';

import 'package:e_commerce_project/ui/api_controller/auth_controller.dart';
import 'package:e_commerce_project/ui/data/service/model/response_models.dart';
import 'package:e_commerce_project/ui/data/utilis/urls.dart';
import 'package:http/http.dart';

class Network {
  Network._();

  static Future<ResponseModels> getRequest({required String url}) async {
    try {
      final Response response = await get(
        Uri.parse(Urls.baseurl + url),
        headers: {
          'Content-type': 'json/application',
          'token': AuthController.token.toString()
        },
      );

      print(response.body);
      if (response.statusCode == 200) {
        return ResponseModels(
            isSuccess: true,
            returnData: jsonDecode(response.body),
            statusCode: response.statusCode);
      } else {
        return ResponseModels(
            isSuccess: false,
            returnData: jsonDecode(response.body),
            statusCode: response.statusCode);
      }
    } catch (e) {
      print(e.toString());
      return ResponseModels(
          isSuccess: false, returnData: e.toString(), statusCode: -1);
    }
  }

  static Future<ResponseModels> postRequest(
      {required url, Map<String, dynamic>? body}) async {
    try {
      final Response response = await post(Uri.parse(Urls.baseurl + url),
          headers: {
            "Cotent-type": "application/json",
            "Accept": "application/json",
            "token": AuthController.token.toString()
          },
          body: jsonEncode(body));
      if (response.statusCode == 200) {
       return ResponseModels(
            isSuccess: true,
            returnData: jsonDecode(response.body),
            statusCode: response.statusCode);
      } else {
       return ResponseModels(
            isSuccess: false,
            returnData: jsonDecode(response.body),
            statusCode: response.statusCode);
      }
    } catch (e) {
      return ResponseModels(isSuccess: false,statusCode: -1,returnData: e.toString());
    }
  }
}

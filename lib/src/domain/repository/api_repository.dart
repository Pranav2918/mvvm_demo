import 'package:flutter/material.dart';
import 'package:mvvm_demo/src/config/constants.dart';
import 'package:mvvm_demo/src/data/model/user_model.dart';
import 'package:mvvm_demo/src/domain/network_services.dart';

class AppRepository {
  final ApiService _apiService = NetworkApiService();
  String baseUrl = "https://reqres.in";

  //User login
  Future<dynamic> callUserLoginApi(dynamic data) async {
    var response = await _apiService.postApi(
        "$baseUrl${AppEndpoints.loginEndpoint}", data);
    try {
      return response;
    } catch (e) {
      debugPrint("Failed!!!!");
    }
  }

  //User Listings
  Future<Users?> callUserListingApi() async {
    var response =
        await _apiService.getApi("$baseUrl${AppEndpoints.userEndpoint}");
    try {
      return response = Users.fromJson(response);
    } catch (e) {
      throw "Exception Occured $e";
    }
  }
}

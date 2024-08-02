import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class ApiService {
  Future<dynamic> postApi(String url, dynamic body);

  Future<dynamic> getApi(String url);
}

class NetworkApiService extends ApiService {
  dynamic apiCallResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        debugPrint(response.body.toString());
      case 404:
        debugPrint("Not found :(");   
      default:
        debugPrint("Error during communication");
    }
  }

  @override
  Future getApi(String url) async {
    dynamic apiResponse;
    try {
      http.Response response = await http.get(Uri.parse(url));
      apiResponse = apiCallResponse(response);
      return apiResponse;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future postApi(String url, dynamic body) async {
    dynamic apiResponse;
    try {
      http.Response response = await http.post(Uri.parse(url), body: body);
      apiResponse = apiCallResponse(response);
    } catch (e) {
      debugPrint(e.toString());
    }
    return apiResponse;
  }
}

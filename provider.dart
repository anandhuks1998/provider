import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:projects/api_testing_model.dart';

class ApiTestingProvider extends ChangeNotifier {
  List<ApiModel> apiData = [];
  Future apiTesting() async {
    final httpResponse = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    log("statuscode " + httpResponse.body.toString());
    List<dynamic> list = jsonDecode(httpResponse.body);
    list.forEach((element) {
      apiData.add(ApiModel.fromJson(element));
    });
    log(apiData.first.title.toString());
    notifyListeners();
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../data/models/api_data_model.dart';

class ImageGetController extends GetxController {
  bool _gettingData = false;

  ApiDataModel _data = ApiDataModel();

  bool get gettingData => _gettingData;
  ApiDataModel get data => _data;

  Future<void> fetchData() async {
    _gettingData = true;
    update();
    final response = await http.get(Uri.parse(Constants.apiUrl));
    if(response.statusCode == 200) {
      _data = ApiDataModel.fromJson(jsonDecode(response.body));
      log(_data.total.toString());
    }
    _gettingData = false;
    update();
  }
}
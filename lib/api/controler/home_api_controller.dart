import 'dart:convert';
import 'dart:io';

import 'package:scound_project_elancer/model/HomeMobel/categories_home.dart';
import 'package:scound_project_elancer/model/HomeMobel/data.dart';
import 'package:scound_project_elancer/model/HomeMobel/famous_product.dart';
import 'package:scound_project_elancer/model/HomeMobel/home_base.dart';
import 'package:scound_project_elancer/model/HomeMobel/lastest_products.dart';
import 'package:scound_project_elancer/model/HomeMobel/slider.dart';
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

import '../api_settings.dart';
import 'package:http/http.dart' as http;
class HomeApiController
{
  Future<List<CategoriesHome>> getDataCategory() async {
    var url = Uri.parse(ApiSettings.home);
    var response = await http.get(url,headers:{
      HttpHeaders.authorizationHeader:SharedPrefController().token
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      HomeBase apiResponse = HomeBase.fromJson(jsonResponse);
      return apiResponse.data.categories;
    } else {
      //SHOW MESSAGE
    }
    return [];
  }
  Future<List<Slider>> getDataSlider() async {
    var url = Uri.parse(ApiSettings.home);
    var response = await http.get(url,headers:{
      HttpHeaders.authorizationHeader:SharedPrefController().token
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      HomeBase apiResponse = HomeBase.fromJson(jsonResponse);
      return apiResponse.data.slider;
    } else {
      //SHOW MESSAGE
    }
    return [];
  }
  Future<List<FamousProducts>> getDataFamousProduct() async {
    var url = Uri.parse(ApiSettings.home);
    var response = await http.get(url,headers:{
      HttpHeaders.authorizationHeader:SharedPrefController().token
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      HomeBase apiResponse = HomeBase.fromJson(jsonResponse);
      return apiResponse.data.famousProducts;
    } else {
      //SHOW MESSAGE
    }
    return [];
  }
  Future<List<LatestProducts>> getDataLatestProducts() async {
    var url = Uri.parse(ApiSettings.home);
    var response = await http.get(url,headers:{
      HttpHeaders.authorizationHeader:SharedPrefController().token
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      HomeBase apiResponse = HomeBase.fromJson(jsonResponse);
      return apiResponse.data.latestProducts;
    } else {
      //SHOW MESSAGE
    }
    return [];
  }
}
import 'dart:convert';
import 'dart:io';

import 'package:scound_project_elancer/model/HomeMobel/categories_home.dart';
// import 'package:scound_project_elancer/model/HomeMobel/data.dart';
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
      HttpHeaders.authorizationHeader:SharedPrefController().token,
      HttpHeaders.acceptHeader:'application/json',
      'lang':SharedPrefController().language
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print("ahmed get data");
      HomeBase apiResponse = HomeBase.fromJson(jsonResponse);
      print("ahmed get data");
      return apiResponse.data.categories;
    } else {
      //SHOW MESSAGE
    }
    return [];
  }
  Future<List<SliderModel>> getDataSlider() async {
    var url = Uri.parse(ApiSettings.home);
    var response = await http.get(url,headers:{
      HttpHeaders.authorizationHeader:SharedPrefController().token,
      'lang':SharedPrefController().language
      //HttpHeaders.acceptHeader:'application/json'
    });
  //  print("ahmed get data"+response.body.toString());
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print("ahmed get data"+response.body.toString());
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
      HttpHeaders.authorizationHeader:SharedPrefController().token,
      HttpHeaders.acceptHeader:'application/json',
      'lang':SharedPrefController().language
    });
    print("ahmed getDataFamousProduct"+response.statusCode.toString());
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
      HttpHeaders.authorizationHeader:SharedPrefController().token,
      'lang':SharedPrefController().language
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
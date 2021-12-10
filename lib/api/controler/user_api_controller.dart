import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:scound_project_elancer/model/ProductDetails/base_prodict_detales.dart';
import 'package:scound_project_elancer/model/ProductDetails/opject_prodict.dart';
import 'package:scound_project_elancer/model/categories.dart';
import 'package:scound_project_elancer/model/city.dart';
import 'package:scound_project_elancer/model/list_cat.dart';
import 'package:scound_project_elancer/model/model_city_todata.dart';
import 'package:scound_project_elancer/model/product_model.dart';
import 'package:scound_project_elancer/model/sup_categories.dart';
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

import '../api_settings.dart';

class UserApiController with Helpers{

  Future<List<ListCat>> getCategories() async {
    var url = Uri.parse(ApiSettings.categories);
    var response = await http.get(url
        ,headers:{
      HttpHeaders.authorizationHeader:SharedPrefController().token
    }
    );
    if (response.statusCode == 200) {
      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
      return categoriesJsonArray
          .map((jsonObject) => ListCat.fromJson(jsonObject))
          .toList();
    }
    return [];
  }
  Future<List<SupCategory>> getSupCategories(String idcat) async {
    var url = Uri.parse(ApiSettings.categoriesSup+idcat);
    var response = await http.get(url
        ,headers:{
          HttpHeaders.authorizationHeader:SharedPrefController().token
        }
    );
    if (response.statusCode == 200) {
     // print("ahmed UserApiController"+response.statusCode.toString());
      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
     // print(jsonDecode(response.body)['list'].toString());
      return categoriesJsonArray
          .map((jsonObject) => SupCategory.fromJson(jsonObject))
          .toList();
    }
    return [];
  }
  Future<List<Product>> getProduct(String idcat) async {
    var url = Uri.parse(ApiSettings.product+idcat);
    var response = await http.get(url
        ,headers:{
          HttpHeaders.authorizationHeader:SharedPrefController().token
        }
    );
    print("ahmed UserApiController"+response.statusCode.toString());
    print("ahmed UserApiController"+url.toString());
    if (response.statusCode == 200) {
      print("ahmed UserApiController"+response.statusCode.toString());
      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
     // print(jsonDecode(response.body)['list'].toString());
      return categoriesJsonArray
          .map((jsonObject) => Product.fromJson(jsonObject))
          .toList();
    }
    return [];
  }
  Future<ObjectPr?> getProductDitales(String idcat) async {
    var url = Uri.parse(ApiSettings.productDetales+idcat);
    var response = await http.get(url
        ,headers:{
          HttpHeaders.authorizationHeader:SharedPrefController().token
        }
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print("ahmed get data");
      BaseProdict apiResponse = BaseProdict.fromJson(jsonResponse);
      print("ahmed get data");
      return apiResponse.object;
    }
    print("ahmed UserApiController"+response.statusCode.toString());
    print("ahmed UserApiController"+url.toString());
    // if (response.statusCode == 200) {
    //   print("ahmed UserApiController"+response.statusCode.toString());
    //   var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
    //  // print(jsonDecode(response.body)['list'].toString());
    //   return categoriesJsonArray
    //       .map((jsonObject) => Product.fromJson(jsonObject))
    //       .toList();
    // }
    return null;
  }
  Future<List<CityData>> getCity() async {
    var url = Uri.parse(ApiSettings.cities);
    var response = await http.get(url
        ,headers:{
          HttpHeaders.acceptHeader:'application/json'
        }
    );

    print("Ahmed "+response.statusCode.toString());
    if (response.statusCode == 200) {
      print("Ahmed 200");
      print("Ahmed "+ response.body);
      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
      return categoriesJsonArray
          .map((jsonObject) => CityData.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<bool> RateProduct(BuildContext context,
      {required String productId,required String rate}) async {
    var url = Uri.parse(ApiSettings.productsRate);
    var response = await http.post(url, body: {
      'product_id':productId,
      'rate':rate
    }, headers:{
      HttpHeaders.authorizationHeader:SharedPrefController().token,
      // HttpHeaders.acceptHeader: '*/*',
      // HttpHeaders.acceptEncodingHeader:'gzip,deflate,br'
    }
    );
    print("ahmed"+jsonDecode(response.body)['message'].toString());
    if (response.statusCode == 200) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      //TODO: SHARED PREFERENCES - SAVE LOGGED IN USER DATA!!
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }
    return false;
  }

}

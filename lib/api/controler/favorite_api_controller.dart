import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:scound_project_elancer/model/Favorite/favorite.dart';
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

import '../api_settings.dart';
import 'package:http/http.dart' as http;
class FavoriteApiController with Helpers
{
  Future<List<Favorite>> getFavorite() async {
    var url = Uri.parse(ApiSettings.favoriteProducts);
    var response = await http.get(url
        ,headers:{
          HttpHeaders.authorizationHeader:SharedPrefController().token,
          'lang':SharedPrefController().language
        }
    );
    print("getFavorite"+response.statusCode.toString());
    if (response.statusCode == 200) {
      print("getFavorite"+jsonDecode(response.body)['list'].toString());

      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
      return categoriesJsonArray
          .map((jsonObject) => Favorite.fromJson(jsonObject))
          .toList();

    }
    return [];
  }

  Future<bool> setFavorite(BuildContext context,
      {required String idProduct}) async {
    var url = Uri.parse(ApiSettings.favoriteProducts);
    var response = await http.post(url, body: {
        'product_id':idProduct
    }, headers:{
        HttpHeaders.authorizationHeader:SharedPrefController().token,
      'lang':SharedPrefController().language
        }
    );
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
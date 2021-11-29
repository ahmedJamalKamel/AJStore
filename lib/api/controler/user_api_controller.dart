import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:scound_project_elancer/model/categories.dart';
import 'package:scound_project_elancer/model/list_cat.dart';
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


}

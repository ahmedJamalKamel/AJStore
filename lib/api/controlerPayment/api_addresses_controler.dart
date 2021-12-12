import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:scound_project_elancer/model/ModelPayment/addresses_model.dart';
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

import '../api_settings.dart';

class ApiAddressesController with Helpers
{
  Future<List<Addresses>> getFavorite() async {
    var url = Uri.parse(ApiSettings.addresses);
    var response = await http.get(url
        ,headers:{
          HttpHeaders.authorizationHeader:SharedPrefController().token
        }
    );
    print("getFavorite"+response.statusCode.toString());
    if (response.statusCode == 200) {
      print("getFavorite"+jsonDecode(response.body)['list'].toString());
      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
      return categoriesJsonArray
          .map((jsonObject) => Addresses.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

}
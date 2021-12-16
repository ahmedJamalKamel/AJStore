import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:scound_project_elancer/model/ModelPayment/addresses_model.dart';
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

import '../api_settings.dart';

class ApiAddressesController with Helpers
{
  Future<List<Addresses>> getAddresses() async {
    var url = Uri.parse(ApiSettings.addresses);
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
          .map((jsonObject) => Addresses.fromJson(jsonObject))
          .toList();
    }
    return [];
  }
  Future<bool> delAddresses(BuildContext context,{required String id}) async {
    var url = Uri.parse(ApiSettings.addressesDel+id);
    var response = await http.delete(url,
        headers:{
          HttpHeaders.authorizationHeader:SharedPrefController().token,
          'lang':SharedPrefController().language
        }
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      //TODO: SHARED PREFERENCES - SAVE LOGGED IN USER DATA!!
      //   print(jsonObject['token_type'].toString()+"ahmed");
      return true;
    } else {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }

    return false;
  }

  Future<bool> newAddress(BuildContext context,
      {required String name, required String info,required String contactNumber,required String cityId}) async {
    var url = Uri.parse(ApiSettings.addresses);
    var response = await http.post(url, body: {
      'name': name,
      'info': info,
      'contact_number': contactNumber,
      'city_id': cityId
    },
        headers:{
          HttpHeaders.authorizationHeader:SharedPrefController().token,
          'lang':SharedPrefController().language
        }
    );
    if (response.statusCode == 201) {

      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      //TODO: SHARED PREFERENCES - SAVE LOGGED IN USER DATA!!
   //   print(jsonObject['token_type'].toString()+"ahmed");
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

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:http/http.dart' as http;
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

import '../api_settings.dart';
class UpdateProfileApiController with Helpers
{
  Future<bool> updateProfile(BuildContext context,
      {required String name, required String cityId,required String gender}) async {
    var url = Uri.parse(ApiSettings.updateProfile);
    var response = await http.post(url, body: {
      'city_id': cityId,
      'name': name,
      'gender': gender,
    },
        headers:{
          HttpHeaders.authorizationHeader: SharedPrefController().token,
          HttpHeaders.acceptHeader: 'application/json'
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
      print("ahmed11");
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }
    return false;
  }
  Future<bool> changePassword(BuildContext context,
      {required String carantPass, required String newPass,required String comfirmPass}) async {
    var url = Uri.parse(ApiSettings.changePassword);
    var response = await http.post(url, body: {
      'current_password': carantPass,
      'new_password': newPass,
      'new_password_confirmation': comfirmPass,
    },
        headers:{
          HttpHeaders.authorizationHeader: SharedPrefController().token,
          HttpHeaders.acceptHeader: 'application/json'
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
      print("ahmed11");
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }
    return false;
  }
}
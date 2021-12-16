import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:scound_project_elancer/model/register.dart';
import 'package:scound_project_elancer/model/user.dart';
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

import '../api_settings.dart';

class AuthApiController with Helpers {
  Future<bool> register(BuildContext context,
      {required RegisterUser student}) async {
    var url = Uri.parse(ApiSettings.register);
    var response = await http.post(url, body: {
      'name': student.name,
      'mobile': student.mobile,
      'password': student.password,
      'gender': student.gender,
      'STORE_API_KEY':ApiSettings.storeApiKey,
      'city_id':student.city_id
    },
      headers: {
        'lang':SharedPrefController().language
        }
        );
    print("ahmed "+response.statusCode.toString());
    print("ahmed "+jsonDecode(response.body).toString());

    if (response.statusCode == 201) {
    {  showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
    print(jsonDecode(response.body)['code']);
      return true;
    }
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }
    return false;
  }

  Future<bool> login(BuildContext context, {required String email, required String password}) async {
    var url = Uri.parse(ApiSettings.login);
    var response = await http.post(url, body: {
      'mobile': email,
      'password': password,
    },
    headers:{
      'lang':SharedPrefController().language
    }
    );
    if (response.statusCode == 200) {
      //TODO: SHARED PREFERENCES - SAVE LOGGED IN USER DATA!!
      var jsonObject = jsonDecode(response.body)['data'];
      User student = User.fromJson(jsonObject);
    await  SharedPrefController().save(student: student);
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      print(jsonObject['token_type'].toString()+"ahmed");
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
  Future<bool> logout() async {
    var url = Uri.parse(ApiSettings.logout);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json',
      'lang':SharedPrefController().language
    });
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 401) {
     // SharedPrefController().clear();
      return true;
    }
    return false;
  }

  Future<bool> activePhone(BuildContext context,
      {required String phone, required String code}) async {
    var url = Uri.parse(ApiSettings.activatePhone);
    var response = await http.post(url, body: {
      'mobile': phone,
      'code': code,
    },
        headers:{
          'lang':SharedPrefController().language
        }
    );
    if (response.statusCode == 200) {
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
  Future<bool> forgetPassword(BuildContext context,
      {required String mobile}) async {
    var url = Uri.parse(ApiSettings.forgetPassword);
    var response = await http.post(url, body: {
      'mobile': mobile,
    },
        headers:{
          'lang':SharedPrefController().language
        }
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body)['code']);
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    } else {
      showSnackBar(
        context: context,
        message: 'Something went wrong, please try again!',
        error: true,
      );
    }
    return false;
  }

  Future<bool> resetPassword(
    BuildContext context, {
    required String mobile,
    required String code,
    required String password,
  }) async {
    var url = Uri.parse(ApiSettings.resetPassword);
    var response = await http.post(
      url,
      body: {
        'mobile': mobile,
        'code': code,
        'password': password,
        'password_confirmation': password,
      },
      headers: {HttpHeaders.acceptHeader: 'application/json', 'lang':SharedPrefController().language},
    );

    if (response.statusCode == 200) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    } else if (response.statusCode == 500) {
      showSnackBar(
        context: context,
        message: 'Something went wrong, try again',
        error: true,
      );
    }
    return false;
  }

}

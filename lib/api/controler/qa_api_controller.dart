
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:http/http.dart' as http;
import 'package:scound_project_elancer/model/faqs.dart';
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

import '../api_settings.dart';
class QAApiController with Helpers{

  Future<bool> sendQ(BuildContext context,
      {required String Subject,required String Message}) async {
    var url = Uri.parse(ApiSettings.contactRequests);
    var response = await http.post(url, body: {
      'subject':Subject,
      'message':Message
    }, headers:{
      HttpHeaders.authorizationHeader:SharedPrefController().token,
      // HttpHeaders.acceptHeader: '*/*',
      // HttpHeaders.acceptEncodingHeader:'gzip,deflate,br'
    }
    );
    print("ahmed"+jsonDecode(response.body)['message'].toString());
    if (response.statusCode == 201) {
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
  Future<List<FAQs>> getFAQs() async {
    var url = Uri.parse(ApiSettings.faqs);
    var response = await http.get(url
        ,headers:{
          HttpHeaders.authorizationHeader:SharedPrefController().token
         , HttpHeaders.acceptHeader: 'application/json'
    }
    );
    print("getFavorite"+response.statusCode.toString());
    if (response.statusCode == 200) {
      print("getFavorite"+jsonDecode(response.body)['list'].toString());

      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
      return categoriesJsonArray
          .map((jsonObject) => FAQs.fromJson(jsonObject))
          .toList();

    }
    return [];
  }

}
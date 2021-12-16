import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:scound_project_elancer/model/ModelPayment/addresses_model.dart';
import 'package:scound_project_elancer/model/ModelPayment/card_payment_model.dart';
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

import '../api_settings.dart';

class ApiPaymentController with Helpers
{
  Future<List<PaymentCard>> getPayment() async {
    var url = Uri.parse(ApiSettings.paymentcards);
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
          .map((jsonObject) => PaymentCard.fromJson(jsonObject))
          .toList();
    }
    return [];
  }
  Future<bool> delPayment(BuildContext context,{required String id}) async {
    var url = Uri.parse(ApiSettings.paymentcards+id);
    var response = await http.delete(url,
        headers:{
          HttpHeaders.authorizationHeader:SharedPrefController().token,
          'lang':SharedPrefController().language
        }
    );
    print(SharedPrefController().token);
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

  Future<bool> newCard(BuildContext context,
      {required String HolderName, required String CardNumber,required String Exdate,required String Cvv}) async {
    var url = Uri.parse(ApiSettings.paymentcards);
    var response = await http.post(url, body: {
      'holder_name': HolderName,
      'card_number': CardNumber,
      'exp_date': Exdate,
      'cvv': Cvv,
      'type': "Visa"
    },
        headers:{
          HttpHeaders.authorizationHeader:SharedPrefController().token,
          'lang':SharedPrefController().language
        }
    );
    print(response.statusCode);
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
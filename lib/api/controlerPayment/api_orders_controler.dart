import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:scound_project_elancer/model/ModelPayment/addresses_model.dart';
import 'package:scound_project_elancer/model/ModelPayment/card_payment_model.dart';
import 'package:scound_project_elancer/model/ModelPayment/order_model_view.dart';
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

import '../api_settings.dart';

class ApiOrderController with Helpers
{
  Future<List<OrderModelView>> getOrder() async {
    var url = Uri.parse(ApiSettings.orders);
    var response = await http.get(url
        ,headers:{
          HttpHeaders.authorizationHeader:SharedPrefController().token,
          'lang':SharedPrefController().language
        }
    );
    print("getOrder"+response.statusCode.toString());
    if (response.statusCode == 200) {
      print("getOrder"+jsonDecode(response.body)['list'].toString());
      var categoriesJsonArray = jsonDecode(response.body)['list'] as List;
      return categoriesJsonArray
          .map((jsonObject) => OrderModelView.fromJson(jsonObject))
          .toList();
    }
    return [];
  }


  Future<bool> newOrder(BuildContext context,
      {required var cart, required String addressId,required String cardId}) async {
    var url = Uri.parse(ApiSettings.orders);
    var response = await http.post(url, body: {
      'cart': cart,
      'payment_type': "Online",
      'address_id': addressId,
      'card_id': cardId,
    },
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
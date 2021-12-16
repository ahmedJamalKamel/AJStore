import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:scound_project_elancer/api/controler/user_api_controller.dart';
import 'package:scound_project_elancer/get/databaseGetx/city_getx_controller.dart';
import 'package:scound_project_elancer/get/databaseGetx/order_getx_controller.dart';
import 'package:scound_project_elancer/get/favorite_getx_controller.dart';
import 'package:scound_project_elancer/get/get_all_data_getx_controler.dart';
import 'package:scound_project_elancer/get/orderGetx/order_getx_controler.dart';
import 'package:scound_project_elancer/get/pay_order_address_getx/address_getx_controller.dart';
import 'package:scound_project_elancer/get/pay_order_address_getx/patment_card_getx_controller.dart';
import 'package:scound_project_elancer/model/city.dart';
import 'package:scound_project_elancer/model/model_city_todata.dart';
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  final CityrGetxController _authorGetxController = Get.put<CityrGetxController>(CityrGetxController());

  void getData()
  async {
    List<CityData> list=await UserApiController().getCity();
    print("l"+list.length.toString());
    if(list.isNotEmpty)
    {
      for(int i=0;i<list.length;i++)
      {
        CityrGetxController.to.createContact(list[i]);
      }
    }
      SharedPrefController().ugetCity;
      await  SharedPrefController().setCityCreated();
  }

  @override
  void initState() {
    if(!SharedPrefController().createdCity){
      print("crate city");
      getData();
    }
    if(SharedPrefController().loggedIn){
      final AllDataGetxControler _allDataGetxControler = Get.put<AllDataGetxControler>(AllDataGetxControler());
      final FavoriteGetXController _FavoriteGetxControler = Get.put<FavoriteGetXController>(FavoriteGetXController());
      final OrderGetxController _OrderGetxControler = Get.put<OrderGetxController>(OrderGetxController());
      final AddressGetXController _AddressGetXController = Get.put<AddressGetXController>(AddressGetXController());
      final PaymentCardGetXController _PaymentCardGetXController = Get.put<PaymentCardGetXController>(PaymentCardGetXController());
      final OrderGetXController _OrderGetXController = Get.put<OrderGetXController>(OrderGetXController());
    }

    // TODO: implement initState
    super.initState();
    String root=SharedPrefController().loggedIn?'/home_screen':'/login_screen';
    Future.delayed(const Duration(seconds: 3), () {
      // String route = SharedPrefController().loggedIn
      //     ? '/categories_screen'
      //     : '/login_screen';
      Navigator.pushReplacementNamed(context, root);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Image.asset("image/finalSplash.png")
      ),
    );
  }
}

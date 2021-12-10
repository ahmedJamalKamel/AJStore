import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:scound_project_elancer/api/controler/user_api_controller.dart';
import 'package:scound_project_elancer/get/author_getx_controller.dart';
import 'package:scound_project_elancer/get/favorite_getx_controller.dart';
import 'package:scound_project_elancer/get/get_all_data_getx_controler.dart';
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
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              Colors.blue.shade800,
              Colors.orange.shade600,
            ],
          ),
        ),
        child: const Text(
          'API APP',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

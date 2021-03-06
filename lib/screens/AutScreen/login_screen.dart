import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controler/auth_api_controller.dart';
import 'package:scound_project_elancer/api/controler/user_api_controller.dart';
import 'package:scound_project_elancer/get/databaseGetx/city_getx_controller.dart';
import 'package:scound_project_elancer/get/databaseGetx/order_getx_controller.dart';
import 'package:scound_project_elancer/get/favorite_getx_controller.dart';
import 'package:scound_project_elancer/get/get_all_data_getx_controler.dart';
import 'package:scound_project_elancer/get/orderGetx/order_getx_controler.dart';
import 'package:scound_project_elancer/get/pay_order_address_getx/address_getx_controller.dart';
import 'package:scound_project_elancer/get/pay_order_address_getx/patment_card_getx_controller.dart';
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:scound_project_elancer/model/city.dart';
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';
import 'package:scound_project_elancer/widgets/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>with Helpers {
  late TextEditingController _userNametextEditingController;
  late TextEditingController _passwordtextEditingController;

  @override
  void initState() {
    _userNametextEditingController = TextEditingController();
    _passwordtextEditingController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _userNametextEditingController.dispose();
    _passwordtextEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        children: [
          SizedBox(
            height: 50.h,
          ),
          Container(height: 237.h,width: 227.w,child: Image.asset("image/loginImage.png"),),
          SizedBox(
            height: 28.h,
          ),
          Text(
            AppLocalizations.of(context)!.welcomeback,
            style: TextStyle(
                color: color1, fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(AppLocalizations.of(context)!.welcomebacksub,
              style: TextStyle(color: color3, fontSize: 14.sp)),
          SizedBox(
            height: 30.h,
          ),
          Text(
            AppLocalizations.of(context)!.phone_number,
            style: TextStyle(fontSize: 12.sp, color: color3),
          ),
          SizedBox(
            height: 7.h,
          ),
          AppTextField(
            prefixIcon: Icons.person_outline,
            textEditingController: _userNametextEditingController,
            hint: "599999999",
            textInputType: TextInputType.phone,
            numper: 9,
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            AppLocalizations.of(context)!.password,
            style: TextStyle(fontSize: 12.sp, color: color3),
          ),
          SizedBox(
            height: 7.h,
          ),
          AppTextField(
            prefixIcon: Icons.lock_outline,
            textEditingController: _passwordtextEditingController,
            hint: "********",
            se: true,
          ),
          SizedBox(
            height: 18.h,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed("/forget_password_screen");
            },
            child: Text(
              AppLocalizations.of(context)!.forgetpass,
              style: TextStyle(fontSize: 14.sp, color: color1),
            ),
          ),
          SizedBox(
            height: 48.h,
          ),
          ElevatedButton(
            onPressed: ()async => await performLogin(),
            child: Text(
              AppLocalizations.of(context)!.login,
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(0, 60.h),
              primary: color1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.w)),
              ),
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/register_screen");
              },
              child: Center(
                child: Text(AppLocalizations.of(context)!.register_now,style: TextStyle(color: Colors.blue),),
              )),
          SizedBox(height:10.h)
        ],
      ),
    );
  }
  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_userNametextEditingController.text.isNotEmpty &&
        _passwordtextEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> login() async {
    bool status = await AuthApiController().login(
      context,
      email: _userNametextEditingController.text,
      password: _passwordtextEditingController.text,
    );
    if (status){
      final AllDataGetxControler _allDataGetxControler = Get.put<AllDataGetxControler>(AllDataGetxControler());
      final FavoriteGetXController _FavoriteGetxControler = Get.put<FavoriteGetXController>(FavoriteGetXController());
      final OrderGetxController _OrderGetxControler = Get.put<OrderGetxController>(OrderGetxController());
      final AddressGetXController _AddressGetXController = Get.put<AddressGetXController>(AddressGetXController());
      final PaymentCardGetXController _PaymentCardGetXController = Get.put<PaymentCardGetXController>(PaymentCardGetXController());
      final OrderGetXController _OrderGetXController = Get.put<OrderGetXController>(OrderGetXController());

      Navigator.pushReplacementNamed(context, '/home_screen');

    }
  }

}

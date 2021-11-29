import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controler/auth_api_controller.dart';
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:scound_project_elancer/model/register.dart';
import 'package:scound_project_elancer/screens/AutScreen/password/reset_password_screen.dart';
import 'package:scound_project_elancer/widgets/app_text_field.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>with Helpers {
  late TextEditingController _userNametextEditingController;
  late TextEditingController _passwordtextEditingController;
  late TextEditingController _emailtextEditingController;
  late TextEditingController _mobiletextEditingController;
  late TextEditingController _gendertextEditingController;
//  late TextEditingController _gendertextEditingController;

  @override
  void initState() {
    _userNametextEditingController = TextEditingController();
    _passwordtextEditingController = TextEditingController();
    _emailtextEditingController = TextEditingController();
    _mobiletextEditingController = TextEditingController();
    _gendertextEditingController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _userNametextEditingController.dispose();
    _passwordtextEditingController.dispose();
    _emailtextEditingController.dispose();
    _mobiletextEditingController.dispose();
    _gendertextEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  String _gender = 'M';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        children: [
          Container(
            margin: EdgeInsets.only(top: 40.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 19.w,
                  child: Icon(
                    Icons.clear,
                    color: color1,
                  ),
                  backgroundColor: color3.withOpacity(.2),
                ),
                Container(
                    child: Text(AppLocalizations.of(context)!.needhelp)),
              ],
            ),
          ),
          SizedBox(
            height: 28.h,
          ),
          Text(
            AppLocalizations.of(context)!.getstarted,
            style: TextStyle(
                color: color1, fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(AppLocalizations.of(context)!.getstartedsub,
              style: TextStyle(color: color3, fontSize: 14.sp)),
          SizedBox(
            height: 40.h,
          ),
          // Text(
          //   AppLocalizations.of(context)!.email,
          //   style: TextStyle(fontSize: 12.sp, color: color3),
          // ),
          // SizedBox(
          //   height: 7.h,
          // ),
          // AppTextField(
          //   prefixIcon: Icons.email_outlined,
          //   color: color1,
          //   textEditingController: _emailtextEditingController,
          //   hint: AppLocalizations.of(context)!.username,
          // ),
          // SizedBox(
          //   height: 30.h,
          // ),
          Text(
            "Phone Number",
            style: TextStyle(fontSize: 12.sp, color: color3),
          ),
          SizedBox(
            height: 7.h,
          ),
          AppTextField(
            prefixIcon: Icons.person_outline,
            color: color1,
            textEditingController: _mobiletextEditingController,
            hint: "595685472",
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            AppLocalizations.of(context)!.username,
            style: TextStyle(fontSize: 12.sp, color: color3),
          ),
          SizedBox(
            height: 7.h,
          ),
          AppTextField(
            prefixIcon: Icons.person_outline,
            color: color1,
            textEditingController: _userNametextEditingController,
            hint: AppLocalizations.of(context)!.username,
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
            prefixIcon: Icons.lock_outlined,
            color: color1,
            textEditingController: _passwordtextEditingController,
            hint: AppLocalizations.of(context)!.password,
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(margin: EdgeInsets.only(left: 10.w),child: Text("Gender")),
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  title: const Text('Male'),
                  contentPadding: EdgeInsets.zero,
                  value: 'M',
                  groupValue: _gender,
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        _gender = value;
                      });
                    }
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  title: const Text('Female'),
                  contentPadding: EdgeInsets.zero,
                  value: 'F',
                  groupValue: _gender,
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        _gender = value;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 48.h,
          ),
          Text(
            AppLocalizations.of(context)!.agreeterms,
            style: TextStyle(fontSize: 14.sp, color: color3),
          ),
          SizedBox(
            height: 48.h,
          ),
          ElevatedButton(
            onPressed: () async => await performRegister(),
            child: Text(AppLocalizations.of(context)!.signup,style: TextStyle(fontSize: 12.sp,),),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(0, 60.h),
              primary: color1,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.w)),
              ),
            ),
          )
        ],
      ),
    );
  }
  Future<void> performRegister() async {
    if(checkData()){
      await register();
    }
  }
  bool checkData() {
    if (_userNametextEditingController.text.isNotEmpty &&
        _mobiletextEditingController.text.isNotEmpty &&
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

  Future<void> register() async {
    bool status = await AuthApiController().register(context, student: student);
    if(status) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResetPasswordScreen(phone: student.mobile,),
        ),
      );
    }
  }

  RegisterUser get student {
    RegisterUser student = RegisterUser();
    student.name = _userNametextEditingController.text;
    student.mobile = "597674400";
    student.password = _passwordtextEditingController.text;
    student.gender = "M";
    student.city_id="1";
    return student;
  }
}

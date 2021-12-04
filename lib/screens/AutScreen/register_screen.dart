import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controler/auth_api_controller.dart';
import 'package:scound_project_elancer/get/author_getx_controller.dart';
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:scound_project_elancer/model/register.dart';
import 'package:scound_project_elancer/screens/AutScreen/code_active_screen.dart';
import 'package:scound_project_elancer/widgets/app_text_field.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>with Helpers {
  List<String>items=[];
  String dropdownvalue = '';
  String indexcity="1";

  void getData()
  {
    for(int i=0;i<CityrGetxController.to.city.value.length;i++)
    {
      items.add(CityrGetxController.to.city.value[i].nameEn);
    }
    dropdownvalue=items[0];
  }

  late TextEditingController _userNametextEditingController;
  late TextEditingController _passwordtextEditingController;
  late TextEditingController _emailtextEditingController;
  late TextEditingController _mobiletextEditingController;
  late TextEditingController _gendertextEditingController;
//  late TextEditingController _gendertextEditingController;
    bool chekBooks=false;
  @override
  void initState() {
    getData();
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
          // Container(
          //   margin: EdgeInsets.only(top: 40.h),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       CircleAvatar(
          //         radius: 19.w,
          //         child: Icon(
          //           Icons.clear,
          //           color: color1,
          //         ),
          //         backgroundColor: color3.withOpacity(.2),
          //       ),
          //       Container(
          //           child: Text(AppLocalizations.of(context)!.needhelp)),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 100.h,
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
            textInputType: TextInputType.phone,
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
          Text(
            "City",
            style: TextStyle(fontSize: 12.sp, color: color3),
          ),
          DropdownButton(
            value: dropdownvalue,
            icon: Icon(Icons.keyboard_arrow_down),
            underline: SizedBox(),
            items:items.map((String items) {
              return DropdownMenuItem(
                  value: items,
                  child: Text(items)
              );
            }
            ).toList(),
            onChanged: (value) {
              setState(() {
                dropdownvalue = value.toString();
                for(int i=0;i<items.length;i++)
                {
                  if(dropdownvalue==items[i])
                  {
                    int j =i+1;
                    setState(() {
                      indexcity=j.toString();
                      print("city selected "+indexcity);
                    });
                  }
                }
              });
            },
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
            height: 10.h,
          ),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.agreeterms,
                style: TextStyle(fontSize: 12.sp, color: color3),
              ),
              SizedBox(width: 10.w,),
              Checkbox(value: chekBooks, onChanged:(value) {
                setState(() {
                  chekBooks=!chekBooks;
                });
              },)
            ],
          ),
          SizedBox(
            height: 30.h,
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
      if(chekBooks)
      {
        return true;
      }
      else{
        showSnackBar(
          context: context,
          message: 'You must agree to the terms of use!',
          error: true,
        );
      }
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
    student.mobile = _mobiletextEditingController.text;
    student.password = _passwordtextEditingController.text;
    student.gender = _gender;
    student.city_id=indexcity;
    return student;
  }
}

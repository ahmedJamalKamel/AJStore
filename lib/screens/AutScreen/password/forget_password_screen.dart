import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controler/auth_api_controller.dart';
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:scound_project_elancer/screens/AutScreen/password/reset_password_screen.dart';
import 'package:scound_project_elancer/widgets/app_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with Helpers {
  late TextEditingController _emailTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 67.h, horizontal: 28.w),
        children: [
          Row(
            children: [
              InkWell(
                onTap: (){
                print("ahmed");
                Navigator.pop(context);
                },
                child: Container(
                  height: 38.h,
                  width: 38.w,
                  decoration:
                  BoxDecoration(
                      color: color3.withOpacity(.2),
                      borderRadius: BorderRadius.circular(19.w)),
                  child: Center(child: Icon(Icons.arrow_back_ios,size: 8.h,color: color1,)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 48.h,
          ),
          Text(
            AppLocalizations.of(context)!.forgetpass,
            style: TextStyle(
                color: color1, fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(AppLocalizations.of(context)!.forgetpasssup,
              style: TextStyle(color: color3, fontSize: 14.sp)),
          SizedBox(height: 55.h),
          AppTextField(
            hint: '22222222222',
            //controller: _emailTextController,
            textEditingController: _emailTextController,
            prefixIcon: Icons.phone_android,
            color: color1,
          ),
          SizedBox(height: 84.h),
          ElevatedButton(
            onPressed: () async => await performForgetPassword(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 21.w,right: 21.w),
                  child: Text(
                    AppLocalizations.of(context)!.tcontunue,
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Container(
                  height: 38.h,
                  width: 38.w,
                  decoration:
                      BoxDecoration(
                          color: color2.withOpacity(.2),
                          borderRadius: BorderRadius.circular(19.w)),
                  child: Center(child: Icon(Icons.arrow_forward_ios,size: 8.h,)),
                )
              ],
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(0, 60.h),
              primary: color1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.w)),
              ),
            ),
          )
        ],
      ),
    );
  }
  Future<void> performForgetPassword() async {
    if (checkData()) {
      await forgetPassword();
    }
  }

  bool checkData() {
    if (_emailTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> forgetPassword() async {
    bool status = await AuthApiController().forgetPassword(
      context,
      mobile: _emailTextController.text,
    );
    // if (status) Navigator.pushReplacementNamed(context, '/reset_password_screen');
    if (status) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResetPasswordScreen(email: _emailTextController.text),
        ),
      );
    }
  }
}

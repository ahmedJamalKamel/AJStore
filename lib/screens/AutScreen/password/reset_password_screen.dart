
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controler/auth_api_controller.dart';
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:scound_project_elancer/widgets/app_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:scound_project_elancer/widgets/code_text_field.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>
    with Helpers {
  late TextEditingController _newPasswordTextController;
  late TextEditingController _newPasswordConfirmationTextController;

  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;

  String? _code;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();

    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();

    _newPasswordTextController = TextEditingController();
    _newPasswordConfirmationTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();

    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();

    _newPasswordTextController.dispose();
    _newPasswordConfirmationTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
            AppLocalizations.of(context)!.phonever,
            style: TextStyle(
                color: color1, fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(AppLocalizations.of(context)!.phoneversup,
              style: TextStyle(color: color3, fontSize: 14.sp)),
          SizedBox(
            height: 8.h,
          ),
          Text(widget.email,
              style: TextStyle(color: color3, fontSize: 14.sp)),
          SizedBox(height: 28.h),

          Row(
            children: [
              Expanded(
                child: CodeTextField(
                  textEditingController: _firstCodeTextController,
                  focusNode: _firstFocusNode,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      _secondFocusNode.requestFocus();
                    }
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CodeTextField(
                  textEditingController: _secondCodeTextController,
                  focusNode: _secondFocusNode,
                  onChanged: (value) {
                    value.isNotEmpty
                        ? _thirdFocusNode.requestFocus()
                        : _firstFocusNode.requestFocus();
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CodeTextField(
                  textEditingController: _thirdCodeTextController,
                  focusNode: _thirdFocusNode,
                  onChanged: (value) {
                    value.isNotEmpty
                        ? _fourthFocusNode.requestFocus()
                        : _secondFocusNode.requestFocus();
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CodeTextField(
                  textEditingController: _fourthCodeTextController,
                  focusNode: _fourthFocusNode,
                  onChanged: (value) {
                    if (value.isEmpty) _thirdFocusNode.requestFocus();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          AppTextField(
            hint: 'Password',
            textEditingController: _newPasswordTextController,
            prefixIcon: Icons.lock,
           // obscureText: true,
          ),
           SizedBox(height: 10.h),
          AppTextField(
            hint: 'Password Confirmation',
            textEditingController: _newPasswordConfirmationTextController,
            prefixIcon: Icons.lock,
            //obscureText: true,
          ),
           SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: () async => await performResetPassword(),
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

  Future<void> performResetPassword() async {
    if (checkData()) {
      await resetPassword();
    }
  }

  bool checkData() {
    if (checkCode() && checkPassword()) {
      return true;
    }
    return false;
  }

  bool checkPassword() {
    if (_newPasswordTextController.text.isNotEmpty &&
        _newPasswordConfirmationTextController.text.isNotEmpty) {
      if (_newPasswordTextController.text ==
          _newPasswordConfirmationTextController.text) {
        return true;
      }
      showSnackBar(
          context: context,
          message: 'Password confirmation error!',
          error: true);
      return false;
    }
    showSnackBar(context: context, message: 'Enter new password!', error: true);
    return false;
  }

  bool checkCode() {
    if (_firstCodeTextController.text.isNotEmpty &&
        _secondCodeTextController.text.isNotEmpty &&
        _thirdCodeTextController.text.isNotEmpty &&
        _fourthCodeTextController.text.isNotEmpty) {
      getVerificationCode();
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter verification code',
      error: true,
    );
    return false;
  }

  String getVerificationCode() {
    return _code = _firstCodeTextController.text +
        _secondCodeTextController.text +
        _thirdCodeTextController.text +
        _fourthCodeTextController.text;
  }


  Future<void> resetPassword() async {
    bool status = await AuthApiController().resetPassword(
      context,
      mobile: widget.email,
      code: _code!,
      password: _newPasswordTextController.text,
    );
    if (status) Navigator.pop(context);
  }
}

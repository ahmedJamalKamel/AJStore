import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controler/auth_api_controller.dart';
import 'package:scound_project_elancer/get/language_getx_controller.dart';
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  _UserAccountScreenState createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedFile;
  Future<void> _pickImage() async {
    XFile? imageFile =
    await _imagePicker.pickImage(source: ImageSource.gallery, imageQuality:50);
    if (imageFile != null) {
      setState(() {
        _pickedFile = imageFile;
      });
      await  SharedPrefController().setImage(imageFile.path);
      // AppLocalizations.of(context)!.getstarted,
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    print(SharedPrefController().imagePathS);
    super.initState();
  }
 bool logout =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
        body: Column(
      children: [
        Container(
          height: 180.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: color9,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.w),
                  bottomRight: Radius.circular(20.w))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SizedBox(
              height: 88.h,
              child: Row(
                children: [
                  Expanded(
                      child: ListTile(
                    title: Text(
                     SharedPrefController().fullName,
                      style: TextStyle(
                          color: color1,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      SharedPrefController().phone,
                      style: TextStyle(color: color1, fontSize: 14.sp),
                    ),
                  )),
                  // SharedPrefController().selectPath?CircleAvatar(
                  //   radius: 40.w,
                  //   child: Align(alignment: AlignmentDirectional.bottomEnd,child: InkWell(
                  //       onTap: (){
                  //         _pickImage();
                  //         print("_pickImage");
                  //       },
                  //       child: Icon(Icons.camera_alt))),
                  // ):
                  CircleAvatar(
                    radius: 40.w,
                    backgroundImage: FileImage(File(SharedPrefController().imagePathS)),
                    child: Align(alignment: AlignmentDirectional.bottomEnd,child: InkWell(
                        onTap: (){
                          _pickImage();
                          print("_pickImage");
                          print("_pickImage"+SharedPrefController().imagePathS);
                        },
                        child: Icon(Icons.camera_alt))),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
            child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          children: [
            InkWell
              (
              onTap: ()
              {
                Navigator.of(context).pushNamed("/edit_my_account_screen");
              },
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: color1,
                ),
                title: Text(
                  AppLocalizations.of(context)!.my_account,
                  style: TextStyle(color: color1,fontSize: 14.sp,fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: color1,
                ),
                subtitle: Text(
                  AppLocalizations.of(context)!.my_account_sup,
                  style: TextStyle(color: color3,fontSize: 14.sp),

              ),
              ),
            ),
            Divider(),
            SizedBox(height: 6.h,),
            InkWell(
              onTap: ()
              {
                LanguageGetxController.to.changeLanguage();
              },
              child: ListTile(
                leading: Icon(
                  Icons.language,
                  color: color1,
                ),
                title: Text(
                  AppLocalizations.of(context)!.language,
                  style: TextStyle(color: color1,fontSize: 14.sp,fontWeight: FontWeight.w500),
                ),
                trailing: Text(LanguageGetxController.to.language.value),
                subtitle: Text(
                  AppLocalizations.of(context)!.language_sup,
                  style: TextStyle(color: color3,fontSize: 14.sp),

                ),
              ),
            ),
            Divider(),
            SizedBox(height: 6.h,),
            InkWell
              (
              onTap: ()
              {
                Navigator.of(context).pushNamed("/fqa_screen");
              },
              child: ListTile(
                leading: Image.asset("image/faq.png",height: 25.h,width: 25.w,),
                title: Text(
                  "FQA",
                  style: TextStyle(color: color1,fontSize: 14.sp,fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: color1,
                ),
                subtitle: Text(
                  AppLocalizations.of(context)!.fqa_sup,
                  style: TextStyle(color: color3,fontSize: 14.sp),

                ),
              ),
            ),
            Divider(),
            SizedBox(height: 6.h,),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed("/ticket_screen");
              },
              child: ListTile(
                leading: Icon(
                  Icons.sticky_note_2_outlined,
                  color: color1,
                ),
                title: Text(
                  AppLocalizations.of(context)!.ticket,
                  style: TextStyle(color: color1,fontSize: 14.sp,fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: color1,
                ),
                subtitle: Text(
                  AppLocalizations.of(context)!.ticket_sup,
                  style: TextStyle(color: color3,fontSize: 14.sp),

                ),
              ),
            ),
            Divider(),
            SizedBox(height: 6.h,),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed("/address_screen");
              },
              child: ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: color1,
                ),
                title: Text(
                  AppLocalizations.of(context)!.my_address,
                  style: TextStyle(color: color1,fontSize: 14.sp,fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: color1,
                ),
                subtitle: Text(
                  AppLocalizations.of(context)!.my_account_sup,
                  style: TextStyle(color: color3,fontSize: 14.sp),

                ),
              ),
            ),
            Divider(),
            SizedBox(height: 6.h,),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed("/view_payment_card_screen");
              },
              child: ListTile(
                leading: Icon(
                  Icons.payment,
                  color: color1,
                ),
                title: Text(
                  AppLocalizations.of(context)!.payment_method,
                  style: TextStyle(color: color1,fontSize: 14.sp,fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: color1,
                ),
                subtitle: Text(
                  AppLocalizations.of(context)!.payment_method_sup,
                  style: TextStyle(color: color3,fontSize: 12.sp),

                ),
              ),
            ),
            Divider(),
            SizedBox(height: 6.h,),
            InkWell(
              onTap: (){
                 Navigator.of(context).pushNamed("/order_view_screen");
              },
              child: ListTile(
                leading: Icon(
                  Icons.work,
                  color: color1,
                ),
                title: Text(
                  AppLocalizations.of(context)!.my_order,
                  style: TextStyle(color: color1,fontSize: 14.sp,fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: color1,
                ),
                subtitle: Text(
                  AppLocalizations.of(context)!.my_order_sup,
                  style: TextStyle(color: color3,fontSize: 12.sp),

                ),
              ),
            ),
            Divider(),
            SizedBox(height: 6.h,),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed("/adout_screen");
              },
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  color: color1,
                ),
                title: Text(
                  AppLocalizations.of(context)!.about,
                  style: TextStyle(color: color1,fontSize: 14.sp,fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: color1,
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 6.h,),
            InkWell(
              onTap: ()async{
                setState(() {
                  logout=true;
                });
                  await SharedPrefController().logout();
                  if(await AuthApiController().logout())
                  {
                    Navigator.of(context).pushNamed("/login_screen");
                  }
              },
              child: ListTile(
                leading:logout?CircularProgressIndicator():SizedBox(),
                title: Text(
                  AppLocalizations.of(context)!.log_out,
                  style: TextStyle(color: color1,fontSize: 14.sp,fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.logout,
                  color: color1,
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 80.h,),
          ],
        )),
      ],
    ));
  }
}

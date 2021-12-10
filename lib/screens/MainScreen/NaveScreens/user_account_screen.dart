import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controler/auth_api_controller.dart';
import 'package:scound_project_elancer/get/language_getx_controller.dart';
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

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
        SharedPrefController().setImage(imageFile.path);

      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
 bool logout =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 242.h,
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
                  !SharedPrefController().selectPath?CircleAvatar(
                    radius: 40.w,
                    child: Align(alignment: AlignmentDirectional.bottomEnd,child: InkWell(
                        onTap: (){
                          _pickImage();
                          print("_pickImage");
                        },
                        child: Icon(Icons.camera_alt))),
                  ):
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
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
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
                  "My Account",
                  style: TextStyle(color: color1,fontSize: 14.sp,fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: color1,
                ),
                subtitle: Text(
                  "Edit your informations ",
                  style: TextStyle(color: color3,fontSize: 14.sp),

              ),
              ),
            ),
            Divider(),
            SizedBox(height: 10.h,),
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
                  "Language",
                  style: TextStyle(color: color1,fontSize: 14.sp,fontWeight: FontWeight.w500),
                ),
                trailing: Text(LanguageGetxController.to.language.value),
                subtitle: Text(
                  "Change  language",
                  style: TextStyle(color: color3,fontSize: 14.sp),

                ),
              ),
            ),
            Divider(),
            SizedBox(height: 10.h,),
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
                  "See more frequently ",
                  style: TextStyle(color: color3,fontSize: 14.sp),

                ),
              ),
            ),
            Divider(),
            SizedBox(height: 10.h,),
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
                  "Ticket",
                  style: TextStyle(color: color1,fontSize: 14.sp,fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: color1,
                ),
                subtitle: Text(
                  "Send your Message",
                  style: TextStyle(color: color3,fontSize: 14.sp),

                ),
              ),
            ),
            Divider(),
            SizedBox(height: 10.h,),
            InkWell(
              onTap: ()async{
                setState(() {
                  logout=true;
                });
                    SharedPrefController().logout();
                  if(await AuthApiController().logout())
                  {
                    Navigator.of(context).pushNamed("/login_screen");
                  }
              },
              child: ListTile(
                leading:logout?CircularProgressIndicator():SizedBox(),
                title: Text(
                  "LogOut",
                  style: TextStyle(color: color1,fontSize: 14.sp,fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.logout,
                  color: color1,
                ),
              ),
            ),
            Divider(),
          ],
        )),
      ],
    ));
  }
}

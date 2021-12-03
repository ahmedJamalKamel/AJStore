import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controler/user_api_controller.dart';
import 'package:scound_project_elancer/get/author_getx_controller.dart';
import 'package:scound_project_elancer/model/city.dart';
import 'package:scound_project_elancer/model/model_city_todata.dart';
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  _UserAccountScreenState createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                      "Akemi Yates",
                      style: TextStyle(
                          color: color1,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      "akemi.yates@mail.com",
                      style: TextStyle(color: color1, fontSize: 14.sp),
                    ),
                  )),
                  CircleAvatar(
                    radius: 40.w,
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
            // ListTile(
            //   leading: Icon(
            //     Icons.person,
            //     color: color1,
            //   ),
            //   title: Text(
            //     "My Cards",
            //     style: TextStyle(color: color1,fontSize: 14.sp,fontWeight: FontWeight.w500),
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios,
            //     color: color1,
            //   ),
            //   subtitle: Text(
            //     "Edit your informations ",
            //     style: TextStyle(color: color3,fontSize: 14.sp),
            //
            //   ),
            // ),
            // Divider(),
            // SizedBox(height: 10.h,),
            ListTile(
              leading: Icon(
                Icons.language,
                color: color1,
              ),
              title: Text(
                "Language",
                style: TextStyle(color: color1,fontSize: 14.sp,fontWeight: FontWeight.w500),
              ),
              trailing: Text("en"),
              subtitle: Text(
                "Change  language",
                style: TextStyle(color: color3,fontSize: 14.sp),

              ),
            ),
            Divider(),
            SizedBox(height: 10.h,),
            ListTile(
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
            Divider(),
            SizedBox(height: 10.h,),
            ListTile(
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
            Divider(),
          ],
        )),
      ],
    ));
  }
}

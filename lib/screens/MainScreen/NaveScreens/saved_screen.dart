import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/widgets/Card/card_save.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
        child: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            Row(
              children: [
                Container(
                  height: 30.h,
                  width: 79.w,
                  decoration: BoxDecoration(
                    color: color2,
                    borderRadius: BorderRadius.circular(15.w),
                  ),
                  child: Center(
                      child: Text(
                    "10 items",
                    style: TextStyle(color: Colors.black),
                  )),
                ),
                Container(
                  height: 30.h,
                  width: 79.w,
                  decoration: BoxDecoration(
                    color: color6,
                    borderRadius: BorderRadius.circular(15.w),
                  ),
                  child: Center(
                      child: Text(
                    "10 items",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 10.w, left: 10.w),
                  decoration: BoxDecoration(
                      color: color3.withOpacity(.2),
                      borderRadius: BorderRadius.circular(18.w)),
                  height: 38.h,
                  width: 38.w,
                  child: SvgPicture.asset(
                    "imageSvg/Icon_List.svg",
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Container(
                  //  margin: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
                  // decoration: BoxDecoration(
                  //     color: color3.withOpacity(.2),
                  //     borderRadius: BorderRadius.circular(18.w)),
                  height: 38.h,
                  width: 38.w,
                  child: SvgPicture.asset(
                    "imageSvg/Button_Icon_Circle.svg",
                    //fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CardSave();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



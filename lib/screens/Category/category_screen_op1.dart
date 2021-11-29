import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/widgets/Card/card09.dart';

class CategoryScreenOP1 extends StatefulWidget {
  const CategoryScreenOP1({Key? key}) : super(key: key);

  @override
  _CategoryScreenOP1State createState() => _CategoryScreenOP1State();
}

class _CategoryScreenOP1State extends State<CategoryScreenOP1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  //  margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
                  height: 38.h,
                  width: 38.w,
                  decoration: BoxDecoration(
                      color: color1, borderRadius: BorderRadius.circular(19.w)),
                  child: Center(
                      child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 15.w,
                    ),
                  )),
                ),
                Container(
                  //    margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
                  height: 38.h,
                  width: 38.w,
                  decoration: BoxDecoration(
                      color: color7, borderRadius: BorderRadius.circular(19.w)),
                  child: Center(
                      child: Text(
                    "0",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 46.h,
          ),
          Container(
            height: 72.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 37.w, right: 37.w),
                    child: Text(
                      "Gadgets",
                      style: TextStyle(
                          fontSize: 60.sp, fontWeight: FontWeight.bold),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 37.w, right: 37.w),
                    child: Text(
                      "Shoes",
                      style: TextStyle(
                          fontSize: 60.sp, fontWeight: FontWeight.bold),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 37.w, right: 37.w),
                    child: Text(
                      "Lifestyle",
                      style: TextStyle(
                          fontSize: 60.sp, fontWeight: FontWeight.bold),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 37.w, right: 37.w),
                    child: Text(
                      "Gadgets",
                      style: TextStyle(
                          fontSize: 60.sp, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 106.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card09();
              },
            ),
          )
        ],
      ),
    );
  }
}

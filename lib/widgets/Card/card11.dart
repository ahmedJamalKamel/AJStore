import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scound_project_elancer/Them/colors.dart';
class Card11 extends StatelessWidget {
  const Card11({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
      ),
      child: Stack(
        children: [
          SizedBox(
              child: Image.asset(
                "image/card11.png",
                fit: BoxFit.fitHeight,
              )),
          Container(
            color: HexColor("#979797").withOpacity(.4),
          ),
          Align(
              alignment: AlignmentDirectional.center,
              child: Container(
                margin: EdgeInsets.only(bottom: 64.h),
                child: const Text(
                  "Nike Shoes",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
          Align(
              alignment: AlignmentDirectional.center,
              child: Container(
                  margin: EdgeInsets.only(top: 68.h),
                  decoration: BoxDecoration(
                      color: color2,
                      borderRadius: BorderRadius.circular(14.w)),
                  height: 28.h,
                  width: 28.w,
                  child: Icon(Icons.search_sharp,size: 15.h,)
              )),
        ],
      ),
    );
  }
}
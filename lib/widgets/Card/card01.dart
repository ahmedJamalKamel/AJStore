import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scound_project_elancer/Them/colors.dart';
class Card01 extends StatelessWidget {
   Card01({
    Key? key,
    required this.name,
    required this.image,
      this.price="0",
     this.m=true
  }) : super(key: key);
  String image;
  String name;
  bool m;
  String price;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
      ),
      child: Stack(
        children: [

          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Column(
              children: [
                Expanded(
                //  height: double.infinity,
                  // width: 148.w,
                  child: m?Image.network(
                    image,
                    fit: BoxFit.fill,
                  ):Image.asset(image,fit: BoxFit.fill,),
                ),
                ListTile(
                  title: Text(name,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold),),
                  subtitle: Text("\$ "+price,style: TextStyle(fontSize: 11.sp,)),
                ),
              ],
            ),
          ),
      Align(
          alignment: AlignmentDirectional.topEnd,
            child: Container(
              margin: EdgeInsets.only(
                  top: 10.h, right: 10.w, left: 10.w),
              decoration: BoxDecoration(
                  color: color2,
                  borderRadius: BorderRadius.circular(14.w)),
              height: 28.h,
              width: 28.w,
              child: SvgPicture.asset(
                "imageSvg/Button_Icon_Save.svg",
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          // Align(
          //     alignment: AlignmentDirectional.topEnd,
          //     child: Container(
          //       margin: EdgeInsets.only(
          //           top: 10.h, right: 10.w, left: 10.w),
          //       decoration: BoxDecoration(
          //           color: color2,
          //           borderRadius: BorderRadius.circular(14.w)),
          //       height: 28.h,
          //       width: 28.w,
          //       child: SvgPicture.asset(
          //         "imageSvg/Icon_save.svg",
          //         fit: BoxFit.scaleDown,
          //       ),
          //     )
          //
          // ),
          // Align(
          //   alignment: AlignmentDirectional.bottomEnd,
          //   child: ListTile(
          //     title: Text(name,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),
          //     subtitle: Text("\$ "+price,style: TextStyle(fontSize: 16.sp,)),
          //   ),
          // )
        ],
      ),
    );
  }
}
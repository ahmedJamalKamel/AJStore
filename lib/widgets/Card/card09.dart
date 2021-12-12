import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/model/list_cat.dart';
import 'package:scound_project_elancer/model/sup_categories.dart';
class Card09 extends StatelessWidget {
   Card09({
  required this.supCategory,
    Key? key,
  }) : super(key: key);
   SupCategory supCategory;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 319.h,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 219.h,
              child: Stack(
                children: [
                  SizedBox(height: 219.h,width: double.infinity,child: Image.network(supCategory.imageUrl,fit: BoxFit.fill,)),
                  // Align(
                  //     alignment: AlignmentDirectional.topEnd,
                  //     child: Container(
                  //       margin: EdgeInsets.only(
                  //           top: 10.h, right: 10.w, left: 10.w),
                  //       decoration: BoxDecoration(
                  //           color: color2,
                  //           borderRadius: BorderRadius.circular(14.w),
                  //           border: Border.all(width: 1.w,color: HexColor("#8F92A1"))
                  //       ),
                  //       height: 28.h,
                  //       width: 28.w,
                  //       child: SvgPicture.asset(
                  //         "imageSvg/Icon_save.svg",
                  //         fit: BoxFit.scaleDown,
                  //       ),
                  //     )),
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            Text(supCategory.nameEn,style: TextStyle(color: color1,fontSize: 16.sp,fontWeight: FontWeight.bold),),
            SizedBox(height: 4.h,),
            Text(supCategory.productsCount.toString()+" Items",style: TextStyle(color: color3,fontSize: 16.sp),),
            SizedBox(height: 4.h,),
          ],
        ),
      ),
    );
  }
}
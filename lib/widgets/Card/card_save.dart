import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scound_project_elancer/Them/colors.dart';

class CardSave extends StatelessWidget {
  const CardSave({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125.h,
      child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.w)),
          ),
          child: Row(
            children: [
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.w)),
                  child: Image.asset(
                    "image/savedImage.png",
                    height: 125.h,
                    width: 68.w,
                    fit: BoxFit.fill,
                  )),
              Expanded(
                  child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Chain Reaction Trainers",
                      style: TextStyle(color: color1, fontSize: 12.sp),
                    ),
                    subtitle: Text(
                      "Black",
                      style: TextStyle(color: color1, fontSize: 10.sp),
                    ),
                    trailing: Container(
                      margin: EdgeInsets.only(right: 10.w, left: 10.w),
                      decoration: BoxDecoration(
                          color: color7.withOpacity(.2),
                          borderRadius: BorderRadius.circular(18.w)),
                      height: 38.h,
                      width: 38.w,
                      child: SvgPicture.asset(
                        "imageSvg/Icon_Bin.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "\$ 328",
                      style: TextStyle(
                          color: color1,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Container(
                      margin: EdgeInsets.only(right: 10.w, left: 10.w),
                      decoration: BoxDecoration(
                          color: color1,
                          borderRadius: BorderRadius.circular(18.w)),
                      height: 38.h,
                      width: 38.w,
                      child: Icon(
                        Icons.add,
                        color: color2,
                      ),
                    ),
                  )
                ],
              ))
            ],
          )),
    );
  }
}

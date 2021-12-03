import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scound_project_elancer/Them/colors.dart';
class NavFilter extends StatelessWidget {
  const NavFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w,bottom: 28.h),
      // width: 562.w,
      height: 60.h,
      decoration: BoxDecoration(
          color: color1, borderRadius: BorderRadius.circular(30.w)),
      child: Row(
        children: [
          const Spacer(),
          InkWell(
            onTap: (){},
            child: SizedBox(
              height: 30.h,
              width: 81.w,
              child: IconButton(onPressed: () {

              }, icon: SvgPicture.asset("imageSvg/fultterIcon.svg",fit: BoxFit.fill,)),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: (){},
            child: Row(
              children: [
                Text("Cart Empty",style: TextStyle(color: Colors.white,fontSize: 10.sp),),
                SizedBox(width: 10.w,),
                SvgPicture.asset("imageSvg/Right_Button.svg",color:color2,),
              ],
            ),
          ),
          SizedBox(width: 10.w,)
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Card10 extends StatelessWidget {
  const Card10({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 201.h,
      child: Padding(
        padding:  EdgeInsets.zero,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.w)),
          ),
          child: SizedBox(
            height: 202.h,
            child: Stack(
              children: [
                Image.asset("image/BackgroundSlider.png",fit: BoxFit.fill,),
                Container(margin: EdgeInsets.only(bottom: 55.h),child: Align(alignment: AlignmentDirectional.center,child: Text("New in ",style: const TextStyle(color:Colors.white ),),)),
                Align(alignment: AlignmentDirectional.center,child: Text("Yeeze Edit Collection ",style: TextStyle(color:Colors.white ,fontWeight: FontWeight.bold,fontSize: 22.sp),),),
                //  Align(alignment: AlignmentDirectional.center,child: Text("New in ",style: TextStyle(color:Colors.white ),),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
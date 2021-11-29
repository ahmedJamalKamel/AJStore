import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/widgets/Card/card01.dart';

class CategoryScreenOp2 extends StatefulWidget {
  const CategoryScreenOp2({Key? key}) : super(key: key);

  @override
  _CategoryScreenOp2State createState() => _CategoryScreenOp2State();
}

class _CategoryScreenOp2State extends State<CategoryScreenOp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 281.h,
            child: Stack(
              children: [
                Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.w),
                            bottomRight: Radius.circular(30.w))),
                    height: 281.h,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "image/BackgroundCatLifestyle.png",
                      fit: BoxFit.fill,
                    )),
                Container(
                  clipBehavior: Clip.antiAlias,
                  height: 281.h,
                  decoration: BoxDecoration(
                      color: HexColor("171717").withOpacity(.2),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.w),
                          bottomRight: Radius.circular(30.w))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 125.h),
                  child: Center(
                      child: Text(
                    "Lifestyle",
                    style: TextStyle(
                        color: color2,
                        fontWeight: FontWeight.bold,
                        fontSize: 60.sp),
                  )),
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Container(
                    margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
                    height: 38.h,
                    width: 38.w,
                    decoration: BoxDecoration(
                        //     color: color2,
                        borderRadius: BorderRadius.circular(19.w)),
                    child: SvgPicture.asset("imageSvg/Left_Button.svg"),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
                    height: 38.h,
                    width: 38.w,
                    decoration: BoxDecoration(
                        // color: color2,
                        borderRadius: BorderRadius.circular(19.w)),
                    child: SvgPicture.asset("imageSvg/searchIcon.svg"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Row(
              children: [
                Text("24 of 240"),
              ],
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 5,
              padding: EdgeInsets.symmetric(horizontal: 28.w
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 154 / 220,
                //  crossAxisSpacing: 154/220,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Card01(image: 'image/card08.png',name: 'Best',m: false,);
              },
            ),
          )
        ],
      ),
    );
  }
}

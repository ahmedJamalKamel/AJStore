import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/widgets/Card/card04.dart';
import 'package:scound_project_elancer/widgets/Card/card08.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 60.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        //  margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
                        height: 38.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                            color: color1,
                            borderRadius: BorderRadius.circular(19.w)),
                        child:
                            SvgPicture.asset("imageSvg/Left_Button_Blake.svg")),
                  ),
                  Container(
                    //    margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
                    height: 38.h,
                    width: 38.w,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.w, color: Colors.grey),
                        borderRadius: BorderRadius.circular(19.w)),
                    child: const Center(child: Icon(Icons.more_vert)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              "My Cart",
              style: TextStyle(
                  color: color1, fontSize: 22.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: 5,
              itemBuilder: (context, index) {
                    return Card04();
              },
            ))
          ],
        ),
      ),
    );
  }
}

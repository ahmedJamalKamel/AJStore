import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scound_project_elancer/Them/colors.dart';

class CustomNavBottom extends StatelessWidget {
  const CustomNavBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 10.w, right: 10.w),
      // width: 562.w,
      height: 60.h,
      decoration: BoxDecoration(
          color: color1, borderRadius: BorderRadius.circular(30.w)),
      child: Row(
        children: [
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.home,
              color: color3,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: color3,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_basket,
              color: color3,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.wine_bar_sharp,
              color: color3,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
              color: color3,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
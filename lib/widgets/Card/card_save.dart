import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/model/Favorite/favorite.dart';

class CardSave extends StatelessWidget {
   CardSave({
    Key? key,
    required this.favorite
  }) : super(key: key);
  Favorite favorite;
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
                  child: Image.network(
                    favorite.imageUrl,
                    height: 125.h,
                    width: 68.w,
                    fit: BoxFit.fill,
                  )),
              Expanded(
                  child: Column(
                children: [
                  ListTile(
                    title: Text(
                      favorite.name,
                      style: TextStyle(color: color1, fontSize: 13.sp,fontWeight: FontWeight.bold),
                    ),

                  ),
                  ListTile(
                    title: Text(
                      "\$"+favorite.price.toString(),
                      style: TextStyle(
                          color: color1,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    // trailing: Container(
                    //   margin: EdgeInsets.only(right: 10.w, left: 10.w),
                    //   decoration: BoxDecoration(
                    //       color: color1,
                    //       borderRadius: BorderRadius.circular(18.w)),
                    //   height: 38.h,
                    //   width: 38.w,
                    //   child: Icon(
                    //     Icons.add,
                    //     color: color2,
                    //   ),
                    // ),
                  )
                ],
              ))
            ],
          )),
    );
  }
}

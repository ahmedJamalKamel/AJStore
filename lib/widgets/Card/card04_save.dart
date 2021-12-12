import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:scound_project_elancer/model/Favorite/favorite.dart';
class Card04Save extends StatelessWidget {
   Card04Save({
    Key? key,
    required this.favorite
  }) : super(key: key);
  Favorite favorite;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 94.h,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
        ),
        child: Row(
          children: [
            Image.network(favorite.imageUrl,height: 94.h,width:120.w ,fit: BoxFit.fill,),
            Expanded(
              child: Column(
                children: [
                  ListTile(
                    title: Text(favorite.nameEn,style: TextStyle(color: color3,fontSize: 11.sp),),
                    subtitle: Text("Quantity "+favorite.quantity.toString(),style: TextStyle(color: color1,fontSize: 10.sp),),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15.w),
                    child: Row(
                      children: [
                        Text(favorite.overalRate.toString()),
                        Container(
                          child: RatingBarIndicator(
                            rating: (favorite.overalRate).toDouble(),
                            itemBuilder: (context, index) => Icon(
                               Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 10.0.w,
                            unratedColor: Colors.amber.withAlpha(50),
                            direction: Axis.horizontal,
                          ),
                        ),
                        SizedBox(width: 10.w,),
                        Text("5,1k reviews",style: TextStyle(color: color3,fontSize: 12.sp),),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
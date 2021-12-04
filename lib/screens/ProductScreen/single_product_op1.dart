import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/model/product_model.dart';

class SingleProductOp1 extends StatefulWidget {
   SingleProductOp1({Key? key,required this.product}) : super(key: key);
  Product product;
  @override
  _SingleProductOp1State createState() => _SingleProductOp1State();
}

class _SingleProductOp1State extends State<SingleProductOp1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 627.h,
            child: Image.network(
              widget.product.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          InkWell(
            onTap: () {
               Navigator.pop(context);
            },
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Container(
                margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
                height: 38.h,
                width: 38.w,
                decoration: BoxDecoration(
                    //     color: color2,
                    borderRadius: BorderRadius.circular(19.w)),
                child: SvgPicture.asset("imageSvg/Left_Button_Blake.svg"),
              ),
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
              child: SvgPicture.asset("imageSvg/SharButton.svg"),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              height: 357.h,
              width: 375.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.w),
                      topRight: Radius.circular(20.w))),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 28.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.h,),
                    Center(
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.w)),
                          width: 48.w,
                          height: 5.h,
                          child: Divider(
                            thickness: 5.h,
                            color: color3,
                          )),
                    ),
                    SizedBox(height: 8.h,),
                    Text("Dyson",style: TextStyle(color: color3,fontSize: 12.sp),),
                    Text("Supersonic Hair Dryer",style: TextStyle(color: color1,fontSize: 25.sp,fontWeight: FontWeight.bold),),
                    Container(
                      child: Row(
                        children: [
                          Text("4.0"),
                          Container(
                            child: RatingBarIndicator(
                              rating: 4,
                              itemBuilder: (context, index) => const Icon(
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
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w,bottom: 28.h),
               width: 207.w,
              height: 60.h,
              decoration: BoxDecoration(
                  color: color1, borderRadius: BorderRadius.circular(30.w)),
              child: Row(
                children: [
                  SizedBox(width: 21.w,),
                  Text("Add to Cart",style: TextStyle(color: color2),),
                  Spacer(),
                  Container(
                    height: 38.h,
                      width: 38.w,
                      decoration: BoxDecoration(
                          color: HexColor("#979797"),
                          borderRadius: BorderRadius.circular(18.w)),
                      child: Center(child: Text("0",style: TextStyle(color: color2),))),
                  SizedBox(width: 21.w,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

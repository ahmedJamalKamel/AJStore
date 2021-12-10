import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/model/product_model.dart';
class Card11 extends StatelessWidget {
   Card11({
    Key? key,
    required this.p
  }) : super(key: key);
  Product p;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
      ),
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
              width:  MediaQuery.of(context).size.width,
              child: Image.network(
                p.imageUrl,
                fit: BoxFit.fill,
              )),
          Container(
            color: HexColor("#979797").withOpacity(.4),
          ),
          Align(
              alignment: AlignmentDirectional.center,
              child: Container(
                margin: EdgeInsets.only(bottom: 64.h),
                child:  Text(
                  p.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
          Align(
              alignment: AlignmentDirectional.center,
              child: Container(
                  margin: EdgeInsets.only(top: 68.h),
                  decoration: BoxDecoration(
                      color: color2,
                      borderRadius: BorderRadius.circular(14.w)),
                  height: 28.h,
                  width: 28.w,
                  child: Icon(Icons.search_sharp,size: 15.h,)
              )),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Card08 extends StatelessWidget {
  const Card08({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 156.h,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
        ),
        child: Row(
          children: [
            SizedBox(height: 156.h,width: 120.w,child: Image.asset("image/card08.png",fit: BoxFit.fill,)),
            Expanded(
              child: Column(children: const [
                ListTile(title:Text( "Off White"),subtitle: Text("Suitcase Arrow"),),
              ],),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scound_project_elancer/Them/colors.dart';
class Card04 extends StatelessWidget {
  const Card04({
    Key? key,
  }) : super(key: key);

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
            Image.asset("image/card4.png"),
            Expanded(
              child: Column(
                children: [
                  ListTile(
                    title: Text("Attraction",style: TextStyle(color: color3),),
                    subtitle: Text("Sky Costanera",style: TextStyle(color: color1),),
                    trailing: SvgPicture.asset(
                      "imageSvg/Icon_save.svg",
                      // fit: BoxFit.scaleDown,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
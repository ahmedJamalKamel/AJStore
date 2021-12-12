import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/get/databaseGetx/order_getx_controller.dart';
import 'package:scound_project_elancer/model/Favorite/favorite.dart';
import 'package:scound_project_elancer/model/model_cart_database.dart';

class CardSave extends StatelessWidget {
   CardSave({
    Key? key,
    required this.favorite
  }) : super(key: key);
  OrderData favorite;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: Card(
        elevation: 2,
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
                    favorite.image,
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
                    subtitle:  Text(
                      "price item : \$"+favorite.price,
                      style: TextStyle(
                          color: color3,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: InkWell(
                      onTap: (){
                        OrderData up=favorite;
                        up.cont+=1;
                        OrderGetxController.to.updateContact(up);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10.w, left: 10.w),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(18.w)),
                        height: 38.h,
                        width: 38.w,
                        child: Icon(
                          Icons.add,
                          color: color2,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "item cont : "+favorite.cont.toString(),
                      style: TextStyle(color: color1, fontSize: 13.sp),
                    ),
                    subtitle: Text(
                      "total price : \$"+(int.parse(favorite.price)*favorite.cont).toString(),
                      style: TextStyle(
                          color: color1,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                    ),


                    trailing: InkWell(
                      onTap: (){
                        OrderData up=favorite;
                        if(up.cont>1)
                        {
                          up.cont-=1;
                          OrderGetxController.to.updateContact(up);
                        }
                        else
                          {
                            OrderGetxController.to.deleteContact(up.id);
                          }


                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10.w, left: 10.w),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(18.w)),
                        height: 38.h,
                        width: 38.w,
                        child: Icon(
                          favorite.cont>1?Icons.remove:Icons.delete,
                          color: color2,
                        ),
                      ),
                    ),
                  )
                ],
              ))
            ],
          )),
    );
  }
}

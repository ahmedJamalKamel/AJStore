import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/get/databaseGetx/order_getx_controller.dart';
import 'package:scound_project_elancer/model/ModelPayment/model_new_order.dart';
import 'package:scound_project_elancer/screens/AddressScreen/address_screen.dart';
import 'package:scound_project_elancer/widgets/Card/card04.dart';
import 'package:scound_project_elancer/widgets/Card/card08.dart';
import 'package:scound_project_elancer/widgets/Card/card_save.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  bool lod=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
        child: Obx(() {
          return Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Text(
                "My Cart",
                style: TextStyle(
                    color: color1,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
              !OrderGetxController.to.loading.value &&
                      OrderGetxController.to.order.value.isNotEmpty
                  ? Expanded(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 20.w,
                                right: 20.w,
                                bottom: 10.h,
                                top: 20.h),
                            width: 207.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                                color: color1,
                                borderRadius: BorderRadius.circular(30.w)),
                            child: Row(
                              children: [

                                Container(
                                  height: 60.h,
                                  width: 103.5.w,
                                  decoration: BoxDecoration(
                                      color: color3,
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.w),topLeft: Radius.circular(30.w))),
                                  //color: color3,
                                  child: Center(
                                    child: Text(
                                      "Total",
                                      style: TextStyle(color: color1,fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: (){
                                    lod=true;
                                    List<NewOrderModel> order=[];
                                    for(int i=0;i<OrderGetxController.to.order.value.length;i++)
                                    {
                                      order.add(NewOrderModel(quantity: OrderGetxController.to.order.value[i].cont, product_id: OrderGetxController.to.order.value[i].prodictId));
                                    }
                                    String json=jsonEncode(order);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddressScreen(
                                          json: json,
                                        ),
                                      ),
                                    );
                                    print(json);
                                  },
                                  child: Container(
                                    height: 60.h,
                                    width: 103.5.w,
                                    decoration: BoxDecoration(
                                        color: color1,
                                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.w),topRight: Radius.circular(30.w))),

                                    child: Center(child: Text("Checkout  >",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)),
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Expanded(
                              child: ListView.builder(
                            itemCount:
                                OrderGetxController.to.order.value.length,
                            itemBuilder: (context, index) {
                              return CardSave(
                                  favorite: OrderGetxController
                                      .to.order.value[index]);
                            },
                          )),
                        ],
                      ),
                    )
                  : !OrderGetxController.to.loading.value &&
                          OrderGetxController.to.order.value.isEmpty
                      ? Center(
                          child: Column(
                            children: const [
                              Icon(Icons.warning, size: 80),
                              Text(
                                'NO DATA',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              )
                            ],
                          ),
                        )
                      : Center(child: CircularProgressIndicator())
            ],
          );
        }),
      ),
    );
  }
}

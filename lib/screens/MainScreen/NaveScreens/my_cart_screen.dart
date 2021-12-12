import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/get/databaseGetx/order_getx_controller.dart';
import 'package:scound_project_elancer/widgets/Card/card04.dart';
import 'package:scound_project_elancer/widgets/Card/card08.dart';
import 'package:scound_project_elancer/widgets/Card/card_save.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 28.w,vertical: 28.h),
        child: Obx((){
          return Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Text(
                "My Cart",
                style: TextStyle(
                    color: color1, fontSize: 22.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
              !OrderGetxController.to.loading.value &&
                  OrderGetxController.to.order.value.isNotEmpty
                  ?
              Expanded(
                  child: ListView.builder(
                    itemCount: OrderGetxController.to.order.value.length,
                    itemBuilder: (context, index) {
                      return CardSave(favorite: OrderGetxController.to.order.value[index]);
                    },
                  )): !OrderGetxController.to.loading.value &&
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/get/orderGetx/order_getx_controler.dart';

class OrderViewScreen extends StatefulWidget {
  const OrderViewScreen({Key? key}) : super(key: key);

  @override
  _OrderViewScreenState createState() => _OrderViewScreenState();
}

class _OrderViewScreenState extends State<OrderViewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    OrderGetXController.to.getAllOrder();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx((){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 55.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        //  margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
                          height: 38.h,
                          width: 38.w,
                          decoration: BoxDecoration(
                              color: color1,
                              borderRadius: BorderRadius.circular(19.w)),
                          child:
                          SvgPicture.asset("imageSvg/Left_Button_Blake.svg")),
                    ),
                    Text("My Order"),
                    Container(
                      //    margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
                      height: 38.h,
                      width: 38.w,
                      decoration: BoxDecoration(
                        //   border: Border.all(width: 1.w, color: Colors.grey),
                          borderRadius: BorderRadius.circular(19.w)),
                      // child: const Center(child: Icon(Icons.more_vert)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 53.h,
              ),
              Text(
                "    My Order",
              ),
              SizedBox(
                height: 35.h,
              ),
              !OrderGetXController.to.loadingOrder.value &&
                  OrderGetXController.to.listOrder.value.isNotEmpty
                  ?
              Expanded(
                  child: ListView.builder(
                    itemCount: OrderGetXController.to.listOrder.value.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 57.h,
                        child: Card(
                          child: Row(
                            children: [
                              SizedBox(width: 25.w,),
                              Text(OrderGetXController.to.listOrder.value[index].date),
                              Spacer(),
                              Container(
                                height: 34.h,
                                width: 70.w,
                                decoration: BoxDecoration(
                                    color: color1,
                                    borderRadius: BorderRadius.circular(20.w)
                                ),
                                child: Center(child: Text(OrderGetXController.to.listOrder.value[index].status,style: TextStyle(color: Colors.white,fontSize: 12.sp),)),),
                              SizedBox(width: 15.w,),
                              Container(
                                height: 34.h,
                                width: 34.w,
                                decoration: BoxDecoration(
                                    color: color1,
                                    borderRadius: BorderRadius.circular(20.w)
                                ),
                                child:Center(child: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,),),),
                              SizedBox(width: 25.w,),
                            ],
                          ),
                        ),
                      );
                    },
                  ))
                  : !OrderGetXController.to.loadingOrder.value &&
                  OrderGetXController.to.listOrder.value.isEmpty
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
        })
      ),
    );
  }
}

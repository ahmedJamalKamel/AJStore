import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controlerPayment/api_orders_controler.dart';
import 'package:scound_project_elancer/api/controlerPayment/api_payment_cards_controler.dart';
import 'package:scound_project_elancer/get/pay_order_address_getx/patment_card_getx_controller.dart';
import 'package:string_splitter/src/string_splitter.dart';

class ViewPaymentCardScreen extends StatefulWidget {
   ViewPaymentCardScreen({Key? key,this.json="",this.addressId=""}) : super(key: key);
  String json;
  String addressId;
  @override
  _ViewPaymentCardScreenState createState() => _ViewPaymentCardScreenState();
}

class _ViewPaymentCardScreenState extends State<ViewPaymentCardScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PaymentCardGetXController.to.getAllPaymentCard();
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
                    Text("Payment"),
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
                "    Payment Type",
              ),
              SizedBox(
                height: 35.h,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed("/new_payment_card_screen");
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w, left: 10.w),
                      decoration: BoxDecoration(
                          color: color1, borderRadius: BorderRadius.circular(18
                          .w)),
                      height: 28.h,
                      width: 28.w,
                      child: Icon(
                        Icons.add,
                        color: color2,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Container(
                    child: Text("Add New Card"),
                  ),

                ],
              ),
              !PaymentCardGetXController.to.loadingPaymentCard.value &&
                  PaymentCardGetXController.to.listPaymentCard.value.isNotEmpty
                  ?
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: PaymentCardGetXController.to.listPaymentCard.value.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: InkWell(
                        onTap: ()async{
                          if(widget.json!="")
                          {
                           bool states=await ApiOrderController().newOrder(context, cart: widget.json, addressId: widget.addressId, cardId: PaymentCardGetXController.to.listPaymentCard.value[index].id.toString());
                            if(states)Navigator.of(context).pushReplacementNamed("/order_view_screen");
                          }
                        },
                        child: widget.json!=""?Container(
                          height: 188.h,
                          width: 319.w,
                          decoration: BoxDecoration(
                              color: color6, borderRadius: BorderRadius.circular(20.w)),
                          child: Stack(
                            children: [
                              Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Container(
                                      margin:
                                      EdgeInsets.only(top: 28.h, left: 28.w, right: 28.w),
                                      child: SvgPicture.asset("imageSvg/Card_Chip.svg"))),
                              Align(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: Container(
                                      margin:
                                      EdgeInsets.only(top: 28.h, left: 28.w, right: 28.w),
                                      child: SvgPicture.asset("imageSvg/Master_Logo.svg"))),
                              Align(
                                alignment: AlignmentDirectional.center,
                                child: Container(
                                  child: Text(
                                 //   PaymentCardGetXController.to.listPaymentCard.value[index].cardNumber,
                                    "${PaymentCardGetXController.to.listPaymentCard.value[index].cardNumber.chunk(4)}",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700,
                                        color: color2),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.bottomCenter,
                                child: Container(
                                  margin:
                                  EdgeInsets.only(left: 28.w, right: 28.w, bottom: 28.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        PaymentCardGetXController.to.listPaymentCard.value[index].holderName,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            //fontWeight: FontWeight.w700,
                                            color: color2),
                                      ),
                                      Text(
                                        PaymentCardGetXController.to.listPaymentCard.value[index].expDate,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            // fontWeight: FontWeight.w700,
                                            color: color2),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ):Dismissible(
                            background: const Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                            key: UniqueKey(),
                            onDismissed: (direction) async {
                              ApiPaymentController().delPayment(context, id:PaymentCardGetXController.to.listPaymentCard.value[index].id.toString() );
                            },
                            child: Container(
                              height: 188.h,
                              width: 319.w,
                              decoration: BoxDecoration(
                                  color: color6, borderRadius: BorderRadius.circular(20.w)),
                              child: Stack(
                                children: [
                                  Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Container(
                                          margin:
                                          EdgeInsets.only(top: 28.h, left: 28.w, right: 28.w),
                                          child: SvgPicture.asset("imageSvg/Card_Chip.svg"))),
                                  Align(
                                      alignment: AlignmentDirectional.topEnd,
                                      child: Container(
                                          margin:
                                          EdgeInsets.only(top: 28.h, left: 28.w, right: 28.w),
                                          child: SvgPicture.asset("imageSvg/Master_Logo.svg"))),
                                  Align(
                                    alignment: AlignmentDirectional.center,
                                    child: Container(
                                      child: Text(
                                        //   PaymentCardGetXController.to.listPaymentCard.value[index].cardNumber,
                                        "${PaymentCardGetXController.to.listPaymentCard.value[index].cardNumber.chunk(4)}",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700,
                                            color: color2),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.bottomCenter,
                                    child: Container(
                                      margin:
                                      EdgeInsets.only(left: 28.w, right: 28.w, bottom: 28.h),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            PaymentCardGetXController.to.listPaymentCard.value[index].holderName,
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                //fontWeight: FontWeight.w700,
                                                color: color2),
                                          ),
                                          Text(
                                            PaymentCardGetXController.to.listPaymentCard.value[index].expDate,
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                // fontWeight: FontWeight.w700,
                                                color: color2),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ))
                      ),
                    );
                  },),
              )
                  : !PaymentCardGetXController.to.loadingPaymentCard.value &&
                  PaymentCardGetXController.to.listPaymentCard.value.isEmpty
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
            ],);
        })
      ),
    );
  }
}

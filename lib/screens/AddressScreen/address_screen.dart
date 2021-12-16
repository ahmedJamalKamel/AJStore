import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controlerPayment/api_addresses_controler.dart';
import 'package:scound_project_elancer/get/pay_order_address_getx/address_getx_controller.dart';
import 'package:scound_project_elancer/screens/PayMentScreen/view_payment_card_screen.dart';

class AddressScreen extends StatefulWidget {
   AddressScreen({Key? key,this.json=""}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
  String json;
}

class _AddressScreenState extends State<AddressScreen> {

  @override
  void initState() {
    AddressGetXController.to.getAllAddress();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Obx(() {
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
                    Text("Address"),
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
                "My Addresses",
              ),
              SizedBox(
                height: 35.h,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed("/new_address_screen");
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
                    child: Text("Add New Address"),
                  ),
                ],
              ),
              !AddressGetXController.to.loadingAddress.value &&
                  AddressGetXController.to.listAddress.value.isNotEmpty
                  ?
              Expanded(
                child: ListView.builder(
                  itemCount: AddressGetXController.to.listAddress.value.length,
                  itemBuilder: (context, index) {
                    return
                     widget.json!=""?InkWell(
                       onTap: (){
                         Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(
                             builder: (context) => ViewPaymentCardScreen(
                               json: widget.json,
                               addressId: AddressGetXController.to.listAddress.value[index].id.toString(),
                             ),
                           ),
                         );
                       },
                       child: Card(
                         clipBehavior: Clip.antiAlias,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.all(Radius.circular(15.w)),
                         ),
                         child: ListTile(title: Text(
                             AddressGetXController.to.listAddress.value[index]
                                 .name),
                           subtitle: Text(
                               AddressGetXController.to.listAddress.value[index]
                                   .info),
                           trailing: Icon(Icons.edit, color: color1,),
                         ),),
                     ):Dismissible(
                        background: const Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                        key: UniqueKey(),
                        onDismissed: (direction) async {
                          ApiAddressesController().delAddresses(context, id:AddressGetXController.to.listAddress.value[index].id.toString() );
                        },
                        child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.w)),
                        ),
                        child: ListTile(title: Text(
                            AddressGetXController.to.listAddress.value[index]
                                .name),
                          subtitle: Text(
                              AddressGetXController.to.listAddress.value[index]
                                  .info),
                          trailing: Icon(Icons.edit, color: color1,),
                        ),));
                  },
                ),
              )
                  : !AddressGetXController.to.loadingAddress.value &&
                  AddressGetXController.to.listAddress.value.isEmpty
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

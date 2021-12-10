import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controler/qa_api_controller.dart';
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:scound_project_elancer/widgets/app_text_field.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> with Helpers {
  late TextEditingController _textEditingController;
  late TextEditingController _maseegeTextEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _maseegeTextEditingController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _maseegeTextEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300.h,
              child: Card(
                elevation: 5.w,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15.h),
                      bottomLeft: Radius.circular(15.h)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Column(
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
                                  child: SvgPicture.asset(
                                      "imageSvg/Left_Button_Blake.svg")),
                            ),
                            const Text("Ticket"),
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
                        "Hello! How can we\n help you?",
                        style: TextStyle(
                            color: color1,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      Text(
                        "Press the heart button\n to add an hotel. ",
                        style: TextStyle(color: color3, fontSize: 12.sp),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 28.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Subject",
                    style: TextStyle(
                        color: color1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  AppTextField(
                    hint: "Problem in Payment method",
                    textEditingController: _textEditingController,
                    prefixIcon: Icons.add,
                    ticket: false,
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  Text(
                    "Message",
                    style: TextStyle(
                        color: color1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  AppTextField(
                    hint:
                        "All of them! USPS, UPS, and Fedex are all options that can gather real time weights for your packages. I always recommend USPS because it’s fairly easy to set up and integrate. The most complicated is the Fedex extension. ",
                    textEditingController: _maseegeTextEditingController,
                    prefixIcon: Icons.add,
                    ticket: false,
                    line: 7,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30.h),
                    child: ElevatedButton(
                      onPressed: ()async => await performSendQ(),
                      child: Text(
                        "SEND",
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 60.h),
                        primary: color1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.w)),
                        ),
                      ),
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

  Future<void> performSendQ() async {
    if (checkData()) {
      await SENDQ();
    }
  }

  bool checkData() {
    if (_textEditingController.text.isNotEmpty &&
        _maseegeTextEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> SENDQ() async {
    bool status = await QAApiController().sendQ(context,
        Subject: _textEditingController.text,
        Message: _maseegeTextEditingController.text);
    if (status) {
      clear();
    }
  }
  void clear(){
    _maseegeTextEditingController.clear();
    _textEditingController.clear();
  }
}

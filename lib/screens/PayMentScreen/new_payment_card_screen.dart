import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controler/auth_api_controller.dart';
import 'package:scound_project_elancer/api/controlerPayment/api_addresses_controler.dart';
import 'package:scound_project_elancer/api/controlerPayment/api_payment_cards_controler.dart';
import 'package:scound_project_elancer/get/databaseGetx/city_getx_controller.dart';
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:scound_project_elancer/model/model_city_todata.dart';
import 'package:scound_project_elancer/model/register.dart';
import 'package:scound_project_elancer/screens/AutScreen/code_active_screen.dart';
import 'package:scound_project_elancer/widgets/app_text_field.dart';

class NewCardeScreen extends StatefulWidget {
  const NewCardeScreen({Key? key}) : super(key: key);

  @override
  _NewCardeScreenState createState() => _NewCardeScreenState();
}

class _NewCardeScreenState extends State<NewCardeScreen> with Helpers {
  //List<String> items = ["a", "m"];
  late CityData dropdownvalue;

  bool createDrop = false;
  String indexcity = "1";
  List<CityData> city = [];

  late TextEditingController _CardHoldertextEditingController;
  late TextEditingController _CardNumbertextEditingController;
  late TextEditingController _YeartextEditingController;
  late TextEditingController _MonthNametextEditingController;
  late TextEditingController _DaytextEditingController;
  late TextEditingController _CvvtextEditingController;
  late Future<List<CityData>> _future;

//  late TextEditingController _gendertextEditingController;
  bool chekBooks = false;

  @override
  void initState() {
    _future = CityrGetxController.to.readContacts();
    // getData();
    _CardHoldertextEditingController = TextEditingController();
    _CardNumbertextEditingController = TextEditingController();
    _YeartextEditingController = TextEditingController();
    _MonthNametextEditingController = TextEditingController();
    _DaytextEditingController = TextEditingController();
    _CvvtextEditingController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _CardHoldertextEditingController.dispose();
    _CardNumbertextEditingController.dispose();
    _YeartextEditingController.dispose();
    _MonthNametextEditingController.dispose();
    _DaytextEditingController.dispose();
    _CvvtextEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  String _gender = 'M';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                Text("Add New Card"),
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
            height: 30.h,
          ),
          Container(
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
                      "5488   0269   6686   3990",
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
                          "Ahmed Jamal",
                          style: TextStyle(
                              fontSize: 12.sp,
                              //fontWeight: FontWeight.w700,
                              color: color2),
                        ),
                        Text(
                          "04 / 2026",
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
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Card Holder",
            style: TextStyle(fontSize: 12.sp, color: color3),
          ),
          SizedBox(
            height: 7.h,
          ),
          AppTextField(
            prefixIcon: Icons.person_outline,
            color: color1,
            textInputType: TextInputType.text,
            textEditingController: _CardHoldertextEditingController,
            hint: "AhmedJamal",
          ),
          SizedBox(
            height: 20.h,
          ),
          ListTile(
            title: Text(
              "Card Number",
              style: TextStyle(fontSize: 12.sp, color: color3),
            ),
            subtitle: AppTextField(
              prefixIcon: Icons.payment,
              color: color1,
              textInputType: TextInputType.number,
              numper: 16,
              textEditingController: _CardNumbertextEditingController,
              hint: "5488 0269 6686 3990",
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Expiry Date",
            style: TextStyle(fontSize: 12.sp, color: color3),
          ),
          SizedBox(
            height: 7.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Yaer",
                    textAlign: TextAlign.center,
                  ),
                  subtitle: TextField(
                    controller: _YeartextEditingController,
                    decoration: InputDecoration(
                        hintText: "2020",
                        enabledBorder: outlineBorder(),
                        focusedBorder: outlineBorder(color: Colors.blue)),
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Month",
                    textAlign: TextAlign.center,
                  ),
                  subtitle: TextField(
                    controller: _MonthNametextEditingController,
                    decoration: InputDecoration(
                        hintText: "08",
                        enabledBorder: outlineBorder(),
                        focusedBorder: outlineBorder(color: Colors.blue)),
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Day",
                    textAlign: TextAlign.center,
                  ),
                  subtitle: TextField(
                    controller: _DaytextEditingController,
                    decoration: InputDecoration(
                        hintText: "08",
                        enabledBorder: outlineBorder(),
                        focusedBorder: outlineBorder(color: Colors.blue)),
                  ),
                ),
              ),
              SizedBox(
                width: 40.w,
              ),
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Cvv",
                    textAlign: TextAlign.center,
                  ),
                  subtitle: TextField(
                    controller: _CvvtextEditingController,
                    obscureText: true,
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "277",
                        counterText: "",
                        enabledBorder: outlineBorder(),
                        focusedBorder: outlineBorder(color: Colors.blue)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            height: 30.h,
          ),
          ElevatedButton(
            onPressed: () async=>await performCardPay(),
            child: Text(
              "Add",
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(0, 60.h),
              primary: color1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.w)),
              ),
            ),
          )
        ],
      ),
    );
  }

  OutlineInputBorder outlineBorder({Color color = Colors.grey}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: color,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
  Future<void> performCardPay() async {
    if (checkData()) {
      await addNewCarde();
    }
  }
  bool checkData() {
    if (_DaytextEditingController.text.isNotEmpty &&
        _MonthNametextEditingController.text.isNotEmpty &&
        _YeartextEditingController.text.isNotEmpty &&
        _CardNumbertextEditingController.text.isNotEmpty &&
        _CardHoldertextEditingController.text.isNotEmpty &&
        _CvvtextEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }
  String  exData()
  {
    if(checkData())
    {
      String ex=_YeartextEditingController.text+"-"+_MonthNametextEditingController.text+"-"+_DaytextEditingController.text;
      return ex;
    }
    else {
      return "";
    }
  }
  Future<void> addNewCarde() async {
    bool status = await ApiPaymentController().newCard(
        context, HolderName: _CardHoldertextEditingController.text,
        CardNumber: _CardNumbertextEditingController.text,
        Exdate: exData(),
        Cvv: _CvvtextEditingController.text);
    if (status) {
      Navigator.of(context).pushReplacementNamed("/view_payment_card_screen");
    }
  }
}

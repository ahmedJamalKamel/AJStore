import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controler/auth_api_controller.dart';
import 'package:scound_project_elancer/api/controlerPayment/api_addresses_controler.dart';
import 'package:scound_project_elancer/get/databaseGetx/city_getx_controller.dart';
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:scound_project_elancer/model/model_city_todata.dart';
import 'package:scound_project_elancer/model/register.dart';
import 'package:scound_project_elancer/screens/AutScreen/code_active_screen.dart';
import 'package:scound_project_elancer/widgets/app_text_field.dart';

class NewAddressScreen extends StatefulWidget {
  const NewAddressScreen({Key? key}) : super(key: key);

  @override
  _NewAddressScreenState createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> with Helpers {
  //List<String> items = ["a", "m"];
  late CityData dropdownvalue ;
  bool createDrop=false;
  String indexcity = "1";
  List<CityData> city = [];


  late TextEditingController _AddrestextEditingController;
  late TextEditingController _phonetextEditingController;
  late TextEditingController _emailtextEditingController;
  late TextEditingController _addressNametextEditingController;
  late TextEditingController _gendertextEditingController;
  late Future<List<CityData>> _future;

//  late TextEditingController _gendertextEditingController;
  bool chekBooks = false;

  @override
  void initState() {

    _future = CityrGetxController.to.readContacts();
    // getData();
    _AddrestextEditingController = TextEditingController();
    _phonetextEditingController = TextEditingController();
    _emailtextEditingController = TextEditingController();
    _addressNametextEditingController = TextEditingController();
    _gendertextEditingController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _AddrestextEditingController.dispose();
    _phonetextEditingController.dispose();
    _emailtextEditingController.dispose();
    _addressNametextEditingController.dispose();
    _gendertextEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  String _gender = 'M';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
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
            height: 20.h,
          ),
          Text(
            "New Address",
            style: TextStyle(
                color: color1, fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            "Address Name",
            style: TextStyle(fontSize: 12.sp, color: color3),
          ),
          SizedBox(
            height: 7.h,
          ),
          AppTextField(
            prefixIcon: Icons.person_outline,
            color: color1,
            textInputType: TextInputType.text,
            textEditingController: _addressNametextEditingController,
            hint: "",
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            "Address Info",
            style: TextStyle(fontSize: 12.sp, color: color3),
          ),
          SizedBox(
            height: 7.h,
          ),
          AppTextField(
            prefixIcon: Icons.location_on,
            color: color1,
            textEditingController: _AddrestextEditingController,
            hint: "Palstine_Gaza_DierAlBalh",
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            "Contact Number",
            style: TextStyle(fontSize: 12.sp, color: color3),
          ),
          SizedBox(
            height: 7.h,
          ),
          AppTextField(
            prefixIcon: Icons.phone,
            color: color1,
            textInputType: TextInputType.phone,
            textEditingController: _phonetextEditingController,
            hint: "597674455",
            numper: 9,
            //se: true,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "City",
            style: TextStyle(fontSize: 12.sp, color: color3),
          ),
          FutureBuilder<List<CityData>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                city = snapshot.data ?? [];
                print(city.length.toString()+"ahmed");
                if(!createDrop) dropdownvalue=city.first;
                print(dropdownvalue.nameAr+"ahmed");
                return DropdownButton<CityData>(
                  value: dropdownvalue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  underline: SizedBox(),
                  items: city.map((e) {
                    return DropdownMenuItem<CityData>(child: Text(e.nameEn),value: e,);
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      dropdownvalue = value!;
                      createDrop=true;
                      indexcity=value.id.toString();
                      print(indexcity);
                      print(dropdownvalue.nameEn);
                    });
                  },
                );
              }
              else {
                return Center(
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
                );
              }
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          ElevatedButton(
            onPressed: () async => await performAddress(),
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

  Future<void> performAddress() async {
    if (checkData()) {
      await addNewAddress();
    }
  }

  bool checkData() {
    if (_AddrestextEditingController.text.isNotEmpty &&
        _addressNametextEditingController.text.isNotEmpty &&
        _phonetextEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> addNewAddress() async {
    bool status = await ApiAddressesController().newAddress(context, name: _addressNametextEditingController.text, info: _AddrestextEditingController.text, contactNumber: _phonetextEditingController.text, cityId: indexcity);
    if (status) {
        Navigator.pop(context);
    }
  }

}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controler/update_profile_api_controler.dart';
import 'package:scound_project_elancer/get/author_getx_controller.dart';
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:scound_project_elancer/model/model_city_todata.dart';
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';
import 'package:scound_project_elancer/widgets/app_text_field.dart';

class EditMyAccountScreen extends StatefulWidget {
  const EditMyAccountScreen({Key? key}) : super(key: key);

  @override
  _EditMyAccountScreenState createState() => _EditMyAccountScreenState();
}

class _EditMyAccountScreenState extends State<EditMyAccountScreen>
    with Helpers {
  late TextEditingController _userNametextEditingController;
  late TextEditingController currentPasswordEditingController;
  late TextEditingController newPasswordEditingController;
  late TextEditingController confirmationPasswordEditingController;
  String _gender = SharedPrefController().gender;
  String fullname = SharedPrefController().fullName;
  late Future<List<CityData>> _future;
  late Future<CityData> _future12;
  // String fullname = SharedPrefController().fullName;
  late CityData dropdownvalue ;
  late CityData a ;
  bool createDrop=false;
  String indexcity = "1";
  List<CityData> city = [];
  //
  bool changePass=false;
  // void getData() async{
  //   dropdownvalue =await SharedPrefController().getCity();
  // }

  @override
  void initState() {
   //  getData();
    dropdownvalue = SharedPrefController().ugetCity;
    a = SharedPrefController().ugetCity;
    print(dropdownvalue.name);
     _future = CityrGetxController.to.readContacts();
   // _future12 = SharedPrefController().ugetCity;
    _userNametextEditingController = TextEditingController();
    currentPasswordEditingController = TextEditingController();
    newPasswordEditingController = TextEditingController();
    confirmationPasswordEditingController = TextEditingController();
    _userNametextEditingController.text = fullname;
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _userNametextEditingController.dispose();
    currentPasswordEditingController.dispose();
    newPasswordEditingController.dispose();
    confirmationPasswordEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: SingleChildScrollView(
          child: Column(
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
                          child: SvgPicture.asset(
                              "imageSvg/Left_Button_Blake.svg")),
                    ),
                    Text("Edit My Account"),
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
                height: 52.h,
              ),
              Container(
                child: Text(
                  "Personal Information",
                  style: TextStyle(
                      color: color1,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp),
                ),
              ),
              SizedBox(
                height: 27.h,
              ),
              Text(
                "Full Name",
                style: TextStyle(fontSize: 12.sp, color: color3),
              ),
              SizedBox(
                height: 7.h,
              ),
              AppTextField(
                prefixIcon: Icons.person_outline,
                color: color1,
                textEditingController: _userNametextEditingController,
                hint: "",
              ),
              SizedBox(
                height: 10.h,
              ),
              Divider(),
              SizedBox(
                height: 10.h,
              ),
              Container(
                  margin: EdgeInsets.only(left: 10.w), child: Text("Gender")),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Male'),
                      contentPadding: EdgeInsets.zero,
                      value: 'M',
                      groupValue: _gender,
                      onChanged: (String? value) {
                        if (value != null) {
                          setState(() {
                            _gender = value;
                          });
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Female'),
                      contentPadding: EdgeInsets.zero,
                      value: 'F',
                      groupValue: _gender,
                      onChanged: (String? value) {
                        if (value != null) {
                          setState(() {
                            _gender = value;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Divider(),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "City",
                style: TextStyle(fontSize: 12.sp, color: color3),
              ),
             // !CityrGetxController.to.loading.value?DropdownButton(
             //    value: dropdownvalue,
             //    icon: Icon(Icons.keyboard_arrow_down),
             //    underline: SizedBox(),
             //    items: items.map((String items) {
             //      return DropdownMenuItem(value: items, child: Text(items));
             //    }).toList(),
             //    onChanged: (value) {
             //      setState(() {
             //        dropdownvalue = value.toString();
             //        for (int i = 0; i < items.length; i++) {
             //          if (dropdownvalue == items[i]) {
             //            int j = i + 1;
             //            setState(() {
             //              indexcity = j.toString();
             //              print("city selected " + indexcity);
             //            });
             //          }
             //        }
             //      });
             //    },
             //  ):CircularProgressIndicator(),
              FutureBuilder<List<CityData>>(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty && dropdownvalue!=null) {
                    city = snapshot.data ?? [];
                    print(city.length.toString()+"ahmed");
                    if(!createDrop)dropdownvalue=city[a.id+1];
                    print(dropdownvalue.name+"ahmed");
                    return DropdownButton<CityData>(
                      value: dropdownvalue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      underline: SizedBox(),
                      items: city.map((e) {
                        print(city.length);
                        return DropdownMenuItem<CityData>(child: Text(e.name),value: e,);
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          dropdownvalue = value!;
                          createDrop=true;
                          indexcity=value.id.toString();
                          print(indexcity);
                          print(dropdownvalue.name);
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
                height: 5.h,
              ),
              !changePass
                  ? ListTile(
                      title: Text(
                        "Do you want to change the password",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 11.sp),
                      ),
                      trailing: InkWell(
                          onTap: () {
                            setState(() {
                              changePass = true;
                            });
                          },
                          child: Text(
                            "Click here",
                            style: TextStyle(color: Colors.blue),
                          )),
                    )
                  : ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        AppTextField(
                          prefixIcon: Icons.lock_outlined,
                          color: color1,
                          textEditingController:
                              currentPasswordEditingController,
                          hint: "current Password",
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AppTextField(
                          prefixIcon: Icons.lock_outlined,
                          color: color1,
                          textEditingController: newPasswordEditingController,
                          hint: "new Password",
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AppTextField(
                          prefixIcon: Icons.lock_outlined,
                          color: color1,
                          textEditingController:
                              confirmationPasswordEditingController,
                          hint: "confirmation Password",
                        ),
                      ],
                    ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                margin: EdgeInsets.only(),
                child: ElevatedButton(
                  onPressed: () async => performUpdateProfile(),
                  child: Text(
                    "done",
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
        ),
      ),
    );
  }

  bool checkData() {
    if (changePass) {
      if (_userNametextEditingController.text.isNotEmpty &&
          indexcity.isNotEmpty &&
          _gender.isNotEmpty &&
          newPasswordEditingController.text.isNotEmpty &&
          confirmationPasswordEditingController.text.isNotEmpty)
      {
        if(newPasswordEditingController.text==confirmationPasswordEditingController.text)
        {
          return true;
        }
        showSnackBar(
          context: context,
          message: 'Make sure the password matches!',
          error: true,
        );
        return false;
      }
    } else if (_userNametextEditingController.text.isNotEmpty &&
        indexcity.isNotEmpty &&
        _gender.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> performUpdateProfile() async {
     if (checkData()) {
       if(changePass)
       {
         await ChangePasswordAndUptaeProfile();
       }
       else{
        await UpdateProfile();
       }
      }
  }

  Future<void> UpdateProfile() async {
    bool status = await UpdateProfileApiController().updateProfile(context,
        name: _userNametextEditingController.text,
        cityId: indexcity,
        gender: _gender);
    if (status) {
      SharedPrefController().updateProfile(
          fullname: _userNametextEditingController.text,
          genderM: _gender,
          cityData: dropdownvalue);
      Navigator.pop(context);
    }
  }
  Future<void> ChangePasswordAndUptaeProfile() async {
    bool statusup = await UpdateProfileApiController().updateProfile(context,
        name: _userNametextEditingController.text,
        cityId: indexcity,
        gender: _gender);
    if (statusup) {
      SharedPrefController().updateProfile(
          fullname: _userNametextEditingController.text,
          genderM: _gender,
          cityData: dropdownvalue);
    //  Navigator.pop(context);
      bool status = await UpdateProfileApiController().changePassword(context,
          carantPass: currentPasswordEditingController.text,
          comfirmPass: confirmationPasswordEditingController.text,
          newPass: newPasswordEditingController.text);
      if (status) {
        // SharedPrefController().updateProfile(
        //     fullname: _userNametextEditingController.text,
        //     genderM: _gender,
        //     cityN: dropdownvalue,
        //     cityID: indexcity);
        Navigator.pop(context);
      }
    }

  }
}

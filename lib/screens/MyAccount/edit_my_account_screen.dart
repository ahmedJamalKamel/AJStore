import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/get/author_getx_controller.dart';
import 'package:scound_project_elancer/widgets/app_text_field.dart';

class EditMyAccountScreen extends StatefulWidget {
  const EditMyAccountScreen({Key? key}) : super(key: key);

  @override
  _EditMyAccountScreenState createState() => _EditMyAccountScreenState();
}

class _EditMyAccountScreenState extends State<EditMyAccountScreen> {
  late TextEditingController _userNametextEditingController;
  String _gender = 'M';

  List<String>items=[];
  String dropdownvalue = '';
  String indexcity="1";
  void getData()
  {
    for(int i=0;i<CityrGetxController.to.city.value.length;i++)
    {
      items.add(CityrGetxController.to.city.value[i].nameEn);
    }
    dropdownvalue=items[0];
  }

  @override
  void initState() {
    getData();
    _userNametextEditingController=TextEditingController();
    _userNametextEditingController.text="ssssss";
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _userNametextEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        margin: EdgeInsets.only(left: 24.w,right: 24.w,bottom: 30.h),
        child: ElevatedButton(
          onPressed: () {},
          child: Text("done",style: TextStyle(fontSize: 12.sp,),),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 60.h),
            primary: color1,
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.w)),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
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
                        child:
                            SvgPicture.asset("imageSvg/Left_Button_Blake.svg")),
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
            SizedBox(height: 10.h,),
            Divider(),
            SizedBox(
              height: 10.h,
            ),
            Container(margin: EdgeInsets.only(left: 10.w),child: Text("Gender")),
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
            DropdownButton(
              value: dropdownvalue,
              icon: Icon(Icons.keyboard_arrow_down),
              underline: SizedBox(),
              items:items.map((String items) {
                return DropdownMenuItem(
                    value: items,
                    child: Text(items)
                );
              }
              ).toList(),
              onChanged: (value) {

                setState(() {
                  dropdownvalue = value.toString();
                  for(int i=0;i<items.length;i++)
                  {
                    if(dropdownvalue==items[i])
                    {
                      int j =i+1;
                      setState(() {
                        indexcity=j.toString();
                        print("city selected "+indexcity);
                      });
                    }
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

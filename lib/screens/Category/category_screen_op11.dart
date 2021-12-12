import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/get/get_all_data_getx_controler.dart';
import 'package:scound_project_elancer/model/list_cat.dart';
import 'package:scound_project_elancer/screens/Category/category_screen_op2.dart';
import 'package:scound_project_elancer/widgets/Card/card09.dart';

class CategoryScreenOP11 extends StatefulWidget {
   CategoryScreenOP11({Key? key,required this.listcat}) : super(key: key);
  ListCat listcat;
  @override
  _CategoryScreenOP11State createState() => _CategoryScreenOP11State();
}

class _CategoryScreenOP11State extends State<CategoryScreenOP11> {
  bool page1 = true;
  bool page2 = false;
  bool page3 = false;
  bool page4 = false;
  List<bool> page=[true,false,false,false];
  @override
  Widget build(BuildContext context) {
    // final PageController controller = PageController(
    //   initialPage: 0,
    //   viewportFraction: .6,
    //   keepPage: true,
    // );
    return Obx((){
      return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            //  margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
                              height: 38.h,
                              width: 38.w,
                              decoration: BoxDecoration(
                                  color: color1, borderRadius: BorderRadius.circular(19.w)),
                              child: SvgPicture.asset("imageSvg/Left_Button_Blake.svg")
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 46.h,
                  ),
                  Center(
                    //margin: EdgeInsets.only(left: 37.w, right: 37.w),
                      child: Text(
                        widget.listcat.name,
                        style:
                        TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold,color: page[0]?color1:color3),
                      )),
                  SizedBox(
                    height: 30.h,
                  ),
                  !AllDataGetxControler.to.loadingsupCategory.value &&
                      AllDataGetxControler.to.supCategory.value.isNotEmpty
                      ? Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      itemCount: AllDataGetxControler.to.supCategory.value.length,
                      itemBuilder: (context, index) {
                        return InkWell(onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryScreenOp2(
                                supCategory: AllDataGetxControler.to.supCategory.value[index],
                              ),
                            ),
                          );
                        },child: Card09(supCategory:AllDataGetxControler.to.supCategory.value[index] ,));
                      },
                    ),
                  ):
                  !AllDataGetxControler.to.loadingsupCategory.value &&
                      AllDataGetxControler.to.supCategory.value.isEmpty
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
              ),
              // Align(
              //   alignment: AlignmentDirectional.bottomCenter,
              //   child: Container(
              //     margin: EdgeInsets.only(left: 20.w, right: 20.w,bottom: 28.h),
              //     // width: 562.w,
              //     height: 60.h,
              //     decoration: BoxDecoration(
              //         color: color1, borderRadius: BorderRadius.circular(30.w)),
              //     child: Row(
              //       children: [
              //         const Spacer(),
              //         Text("146 Items",style: TextStyle(color: color2),),
              //         const Spacer(),
              //         VerticalDivider(color:color3 ,),
              //         const Spacer(),
              //         InkWell(
              //           onTap: (){
              //             Navigator.of(context).pushNamed("/category_screen_op2");
              //           },
              //           child: Row(
              //             children: [
              //               SvgPicture.asset("imageSvg/FiltersIcon.svg",color:color2,),
              //               SizedBox(width: 10.w,),
              //               Text("Add Filters",style: TextStyle(color: Colors.white,fontSize: 10.sp),),
              //             ],
              //           ),
              //         ),
              //         const Spacer(),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          )

      );
    });
  }

  void getData()async{
  await  AllDataGetxControler.to.getSupCategory1(widget.listcat.id.toString());
  }
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }
}

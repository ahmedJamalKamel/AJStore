import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/widgets/Card/card09.dart';

class CategoryScreenOP1 extends StatefulWidget {
  const CategoryScreenOP1({Key? key}) : super(key: key);

  @override
  _CategoryScreenOP1State createState() => _CategoryScreenOP1State();
}

class _CategoryScreenOP1State extends State<CategoryScreenOP1> {
  bool page1 = true;
  bool page2 = false;
  bool page3 = false;
  bool page4 = false;
  List<bool> page=[true,false,false,false];
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(
      initialPage: 0,
      viewportFraction: .6,
      keepPage: true,
    );
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
                    Container(
                      //    margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
                      height: 38.h,
                      width: 38.w,
                      decoration: BoxDecoration(
                          color: color7, borderRadius: BorderRadius.circular(19.w)),
                      child: const Center(
                          child: Text(
                        "0",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 46.h,
              ),
              SizedBox(
                height: 72.h,
                child: PageView(
                  onPageChanged: (value)
                  {
                    setState(()
                    {
                      page=[false,false,false,false];
                      page[value]=!page[value];
                    }
                    );
                  },

                  /// [PageView.scrollDirection] defaults to [Axis.horizontal].
                  /// Use [Axis.vertical] to scroll vertically.
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  children: <Widget>[
                    Center(
                        //margin: EdgeInsets.only(left: 37.w, right: 37.w),
                        child: Text(
                      "Gadgets",
                      style:
                          TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold,color: page[0]?color1:color3),
                    )),
                    Center(
                        // margin: EdgeInsets.only(left: 37.w, right: 37.w),
                        child: Text(
                      "Shoes",
                      style:
                          TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold,color: page[1]?color1:color3),
                    )),
                    Center(
                        //  margin: EdgeInsets.only(left: 37.w, right: 37.w),
                        child: Text(
                      "Lifestyle",
                      style:
                          TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold,color: page[2]?color1:color3),
                    )),
                    Center(
                        // margin: EdgeInsets.only(left: 37.w, right: 37.w),
                        child: Text(
                      "Gadgets",
                      style:
                          TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold,color: page[3]?color1:color3),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card09();
                  },
                ),
              )
            ],
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w,bottom: 28.h),
              // width: 562.w,
              height: 60.h,
              decoration: BoxDecoration(
                  color: color1, borderRadius: BorderRadius.circular(30.w)),
              child: Row(
                children: [
                  const Spacer(),
                 Text("146 Items",style: TextStyle(color: color2),),
                  const Spacer(),
                  VerticalDivider(color:color3 ,),
                  const Spacer(),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed("/category_screen_op2");
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset("imageSvg/FiltersIcon.svg",color:color2,),
                        SizedBox(width: 10.w,),
                        Text("Add Filters",style: TextStyle(color: Colors.white,fontSize: 10.sp),),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

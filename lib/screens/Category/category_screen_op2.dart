import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controler/user_api_controller.dart';
import 'package:scound_project_elancer/get/get_all_data_getx_controler.dart';
import 'package:scound_project_elancer/model/list_cat.dart';
import 'package:scound_project_elancer/model/product_model.dart';
import 'package:scound_project_elancer/model/sup_categories.dart';
import 'package:scound_project_elancer/screens/ProductScreen/single_product_op1.dart';
import 'package:scound_project_elancer/widgets/Card/card01.dart';
import 'package:scound_project_elancer/widgets/NavButtom/nav_filter.dart';

class CategoryScreenOp2 extends StatefulWidget {
  CategoryScreenOp2({Key? key, required this.supCategory}) : super(key: key);
  SupCategory supCategory;

  @override
  _CategoryScreenOp2State createState() => _CategoryScreenOp2State();
}

class _CategoryScreenOp2State extends State<CategoryScreenOp2>
  //  with SingleTickerProviderStateMixin
{
  void getData()async
  {
    await AllDataGetxControler.to.getProduct(widget.supCategory.id.toString());
  }
  @override
  void initState() {
    getData();
  //  print("initState " +widget.cat.id.toString());
    //AllDataGetxControler.to.getProduct(widget.supCategory.id.toString());
   // AllDataGetxControler.to.gatDataProduct(widget.id);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 281.h,
                child: Stack(
                  children: [
                    Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.w),
                                bottomRight: Radius.circular(30.w))),
                        height: 281.h,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          widget.supCategory.imageUrl,
                          fit: BoxFit.fill,
                        )),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 281.h,
                      decoration: BoxDecoration(
                          color: HexColor("171717").withOpacity(.2),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.w),
                              bottomRight: Radius.circular(30.w))),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 125.h),
                      child: Center(
                          child: Text(
                            widget.supCategory.name,
                        style: TextStyle(
                            color: color2,
                            fontWeight: FontWeight.bold,
                            fontSize: 60.sp),
                      )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 28.w, right: 28.w, top: 55.h),
                          height: 38.h,
                          width: 38.w,
                          decoration: BoxDecoration(
                              //     color: color2,
                              borderRadius: BorderRadius.circular(19.w)),
                          child: SvgPicture.asset("imageSvg/Left_Button.svg"),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Container(
                        margin:
                            EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
                        height: 38.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                            // color: color2,
                            borderRadius: BorderRadius.circular(19.w)),
                        child: SvgPicture.asset("imageSvg/searchIcon.svg"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Obx(() {
               return  Expanded(
                  child: !AllDataGetxControler.to.loadingProduct.value &&
                      AllDataGetxControler.to.product.value.isNotEmpty
                      ? GridView.builder(
                          itemCount: AllDataGetxControler.to.product.value.length,
                          padding: EdgeInsets.symmetric(horizontal: 28.w),
                          gridDelegate:
                               SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            childAspectRatio: 154.w / 230.h,
                            //  crossAxisSpacing: 154/220,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SingleProductOp1(
                                      product: AllDataGetxControler.to.product.value[index],
                                    ),
                                  ),
                                );
                              },
                              child: Card01(
                                image: AllDataGetxControler.to.product.value[index].imageUrl,
                                name:   AllDataGetxControler.to.product.value[index].name,
                                price: AllDataGetxControler.to.product.value[index].price.toString(),
                                m: true,
                              ),
                            );
                          },
                        )
                      : !AllDataGetxControler.to.loadingProduct.value &&
                      AllDataGetxControler.to.product.value.isEmpty
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
                          : Center(child: CircularProgressIndicator()),
                );
              }),
            ],
          ),

        ],
      ),
    );
  }
}

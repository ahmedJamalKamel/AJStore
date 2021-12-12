import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controler/auth_api_controller.dart';
import 'package:scound_project_elancer/api/controler/home_api_controller.dart';
import 'package:scound_project_elancer/api/controler/user_api_controller.dart';
import 'package:scound_project_elancer/get/get_all_data_getx_controler.dart';
import 'package:scound_project_elancer/model/HomeMobel/lastest_products.dart';
import 'package:scound_project_elancer/model/HomeMobel/slider.dart';
import 'package:scound_project_elancer/model/list_cat.dart';
import 'package:scound_project_elancer/model/product_model.dart';
import 'package:scound_project_elancer/screens/Category/category_screen_op11.dart';
import 'package:scound_project_elancer/screens/Category/category_screen_op2.dart';
import 'package:scound_project_elancer/screens/ProductScreen/single_product_op1.dart';
import 'package:scound_project_elancer/widgets/Card/card01.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:scound_project_elancer/widgets/Card/card04.dart';
import 'package:scound_project_elancer/widgets/Card/card08.dart';
import 'package:scound_project_elancer/widgets/Card/card09.dart';
import 'package:scound_project_elancer/widgets/Card/card10.dart';
import 'package:scound_project_elancer/widgets/Card/card11.dart';
import 'package:scound_project_elancer/widgets/NavButtom/custom_nav_bottom.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  void data()
  async{
   await AllDataGetxControler.to.getCategory();
   await AllDataGetxControler.to.getLatestProducts();
   await AllDataGetxControler.to.getSliderModel();
   await AllDataGetxControler.to.getAllProduct();
  }
  @override
  void initState() {
   // data();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: color2,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: color2,
        leading: IconButton(
          icon: Container(
              height: 28.h,
              width: 28.w,
              child: SvgPicture.asset("imageSvg/Icon_Menu-Alt.svg")),
          onPressed: () => _scaffoldkey.currentState!.openDrawer(),
          //  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 20.w),
              child: Row(
                children: [
                  Text(
                    "Scan",
                    style: TextStyle(color: color1),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  InkWell(
                    // onTap: () async => await logout(context),
                    child: Container(
                        height: 32.h,
                        width: 32.w,
                        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.w),border: Border.all(width: 1,color: Colors.grey)),
                        child: SizedBox(
                            child: SvgPicture.asset(
                                "imageSvg/Button_Icon_Circle.svg"))),
                  )
                ],
              ))
        ],
      ),
      drawer: Drawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
        child: Obx(
            ()
            {
              return ListView(
                children: [
                  !AllDataGetxControler.to.loadingSliderModel.value &&
                      AllDataGetxControler.to.sliderModel.isNotEmpty
                      ? CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 202.h,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      //viewportFraction: 0.9,
                      aspectRatio: 2.0,
                      initialPage: 2,
                    ),
                    itemCount: AllDataGetxControler.to.sliderModel.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) =>
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          height: 202.h,
                          width: 319.w,
                          child: Image.network(
                            AllDataGetxControler.to.sliderModel[itemIndex].imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                  )
                      : !AllDataGetxControler.to.loadingSliderModel.value &&
                      AllDataGetxControler.to.sliderModel.isEmpty
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
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "Browse by Categories",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: color1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 120.h,
                    child:!AllDataGetxControler.to.loadingCategory.value &&
                        AllDataGetxControler.to.categories.isNotEmpty
                        ?  ListView.builder(
                      padding: EdgeInsets.only(left: 10),
                      itemCount:  AllDataGetxControler.to.categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryScreenOP11(
                                  listcat:  AllDataGetxControler.to.categories.value[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            width: 100.w,
                            child: ListTile(
                              title: Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      color: HexColor("#979797"),
                                      borderRadius:
                                      BorderRadius.circular(30.w)),
                                  child: Image.network(
                                      AllDataGetxControler.to.categories[index].imageUrl)),
                              subtitle: Text(
                                AllDataGetxControler.to.categories[index].name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11.5.sp,
                                  color: color1,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ) :
                    !AllDataGetxControler.to.loadingsupCategory.value &&
                        AllDataGetxControler.to.categories.isEmpty
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
                        : Center(child: CircularProgressIndicator()),),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                      child: Text(
                        "Recommended For You",
                        style: TextStyle(
                            color: color1,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                    // flex: 1,
                    child:!AllDataGetxControler.to.loadingLatestProducts.value &&
                        AllDataGetxControler.to.latestProducts.isNotEmpty
                        ?Container(
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          childAspectRatio: 154 / 220,
                          //  crossAxisSpacing: 154/220,
                          crossAxisSpacing: 10,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        itemCount:  AllDataGetxControler.to.latestProducts.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Product p= Product();
                              p.price=AllDataGetxControler.to.latestProducts.value[index].price;
                              p.nameEn=AllDataGetxControler.to.latestProducts.value[index].nameEn;
                              p.imageUrl=AllDataGetxControler.to.latestProducts.value[index].imageUrl;
                              p.id=AllDataGetxControler.to.latestProducts.value[index].id;
                              p.infoAr=AllDataGetxControler.to.latestProducts.value[index].infoAr;
                              p.isFavorite=AllDataGetxControler.to.latestProducts.value[index].isFavorite;
                              p.infoEn=AllDataGetxControler.to.latestProducts.value[index].infoEn;
                              p.nameAr=AllDataGetxControler.to.latestProducts.value[index].nameAr;
                              p.offerPrice=AllDataGetxControler.to.latestProducts.value[index].offerPrice;
                              p.overalRate=AllDataGetxControler.to.latestProducts.value[index].overalRate;
                              p.productRate=AllDataGetxControler.to.latestProducts.value[index].productRate;
                              p.quantity=AllDataGetxControler.to.latestProducts.value[index].quantity;
                              p.subCategoryId=AllDataGetxControler.to.latestProducts.value[index].subCategoryId;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SingleProductOp1(
                                    product: p,
                                  ),
                                ),
                              );
                            },
                            child: Card01(
                              image:  AllDataGetxControler.to.latestProducts[index].imageUrl,
                              name:  AllDataGetxControler.to.latestProducts[index].name,
                              price: AllDataGetxControler.to.latestProducts[index].price.toString(),
                            ),
                          );
                        },
                      ),
                    ) :
                    !AllDataGetxControler.to.loadingLatestProducts.value &&
                        AllDataGetxControler.to.latestProducts.isEmpty
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
                        : Center(child: CircularProgressIndicator()),),
                ],
              );
            }
        )
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    bool loggedOut = await AuthApiController().logout();
    if (loggedOut) Navigator.pushReplacementNamed(context, '/login_screen');
  }
}

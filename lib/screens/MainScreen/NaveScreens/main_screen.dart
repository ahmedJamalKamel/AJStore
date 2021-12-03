import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controler/auth_api_controller.dart';
import 'package:scound_project_elancer/api/controler/home_api_controller.dart';
import 'package:scound_project_elancer/api/controler/user_api_controller.dart';
import 'package:scound_project_elancer/get/get_all_data_getx_controler.dart';
import 'package:scound_project_elancer/model/HomeMobel/lastest_products.dart';
import 'package:scound_project_elancer/model/HomeMobel/slider.dart';
import 'package:scound_project_elancer/model/list_cat.dart';
import 'package:scound_project_elancer/screens/Category/category_screen_op2.dart';
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
  late Future<List<ListCat>> _future;
  List<ListCat> _categories = <ListCat>[];

  /////
  late Future<List<LatestProducts>> _futureP;
  List<LatestProducts> _latestProducts = <LatestProducts>[];

  ////
  late Future<List<SliderModel>> _futureS;
  List<SliderModel> _SliderModel = <SliderModel>[];

  @override
  void initState() {
    _future = UserApiController().getCategories();
    _futureP = HomeApiController().getDataLatestProducts();
    _futureS = HomeApiController().getDataSlider();
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
                    onTap: () async => await logout(context),
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
        child: Container(
          //width: ,
          child: Stack(
            children: [
              Column(
                children: [
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.of(context).pushNamed("/category_screen_op1");
                  //   },
                  //   child: Container(
                  //     clipBehavior: Clip.antiAlias,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(20)),
                  //     height: 202.h,
                  //     width: 319.w,
                  //     child: Image.asset(
                  //       "image/BackgroundSlider.png",
                  //       fit: BoxFit.fill,
                  //     ),
                  //   ),
                  // ),
                  !AllDataGetxControler.to.loadingSliderModel.value &&
                          AllDataGetxControler.to.sliderModel.isNotEmpty
                      ? CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 202.h,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 0.9,
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
                      : !AllDataGetxControler.to.loadingsupCategory.value &&
                              AllDataGetxControler.to.supCategory.isEmpty
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
                  // FutureBuilder<List<SliderModel>>(
                  //   future: _futureS,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return Center(child: CircularProgressIndicator());
                  //     } else if (snapshot.hasData &&
                  //         snapshot.data!.isNotEmpty) {
                  //       _SliderModel = snapshot.data ?? [];
                  //       return CarouselSlider.builder(
                  //         options: CarouselOptions(
                  //           height: 202.h,
                  //           autoPlay: true,
                  //           enlargeCenterPage: true,
                  //           viewportFraction: 0.9,
                  //           aspectRatio: 2.0,
                  //           initialPage: 2,
                  //         ),
                  //         itemCount: _SliderModel.length,
                  //         itemBuilder: (BuildContext context, int itemIndex,
                  //                 int pageViewIndex) =>
                  //             Container(
                  //           clipBehavior: Clip.antiAlias,
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(20)),
                  //           height: 202.h,
                  //           width: 319.w,
                  //           child: Image.network(
                  //             _SliderModel[itemIndex].imageUrl,
                  //             fit: BoxFit.fill,
                  //           ),
                  //         ),
                  //       );
                  //     } else {
                  //       return Center(
                  //         child: Column(
                  //           children: const [
                  //             Icon(Icons.warning, size: 80),
                  //             Text(
                  //               'NO DATA',
                  //               style: TextStyle(
                  //                 color: Colors.grey,
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 24,
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       );
                  //     }
                  //   },
                  // ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Browse by Categories",
                        style: TextStyle(
                            color: color1,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed("/category_screen_op1");
                        },
                        child: SizedBox(
                            height: 20.h,
                            child: const Text(
                              "More >",
                              style: TextStyle(color: Colors.blue),
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 120.h,
                    child: FutureBuilder<List<ListCat>>(
                      future: _future,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasData &&
                            snapshot.data!.isNotEmpty) {
                          _categories = snapshot.data ?? [];
                          return ListView.builder(
                            padding: EdgeInsets.only(left: 10),
                            itemCount: _categories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CategoryScreenOp2(
                                        id: _categories[index].id.toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 100.w,
                                  child: ListTile(
                                    title: Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                            color: HexColor("#979797"),
                                            borderRadius:
                                                BorderRadius.circular(30.w)),
                                        child: Image.network(
                                            _categories[index].imageUrl)),
                                    subtitle: Text(
                                      _categories[index].nameEn,
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
                          );
                        } else {
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
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: Text(
                    "Recommended For You",
                    style: TextStyle(
                        color: color1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  )),
                  Expanded(
                    child: FutureBuilder<List<LatestProducts>>(
                      future: _futureP,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasData &&
                            snapshot.data!.isNotEmpty) {
                          _latestProducts = snapshot.data ?? [];
                          return GridView.builder(
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
                            itemCount: _latestProducts.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed("/single_product_op1");
                                },
                                child: Card01(
                                  image: _latestProducts[index].imageUrl,
                                  name: _latestProducts[index].nameEn,
                                ),
                              );
                            },
                          );
                        } else {
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    bool loggedOut = await AuthApiController().logout();
    if (loggedOut) Navigator.pushReplacementNamed(context, '/login_screen');
  }
}

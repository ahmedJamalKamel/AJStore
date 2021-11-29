import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controler/auth_api_controller.dart';
import 'package:scound_project_elancer/api/controler/home_api_controller.dart';
import 'package:scound_project_elancer/api/controler/user_api_controller.dart';
import 'package:scound_project_elancer/model/HomeMobel/lastest_products.dart';
import 'package:scound_project_elancer/model/list_cat.dart';
import 'package:scound_project_elancer/widgets/Card/card01.dart';
import 'package:scound_project_elancer/widgets/Card/card04.dart';
import 'package:scound_project_elancer/widgets/Card/card08.dart';
import 'package:scound_project_elancer/widgets/Card/card09.dart';
import 'package:scound_project_elancer/widgets/Card/card10.dart';
import 'package:scound_project_elancer/widgets/Card/card11.dart';

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

  @override
  void initState() {
    _future = UserApiController().getCategories();
    _futureP = HomeApiController().getDataLatestProducts();
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
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/category_screen_op1");
              },
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: 202.h,
                width: 319.w,
                child: Image.asset(
                  "image/BackgroundSlider.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/saved_screen");
              },
              child: Center(
                  child: Text(
                "Browse by Categories",
                style: TextStyle(
                    color: color1,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              )),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 120.h,
              child: FutureBuilder<List<ListCat>>(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    _categories = snapshot.data ?? [];
                    return ListView.builder(
                      padding: EdgeInsets.only(left: 10),
                      itemCount: _categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 85.w,
                          child: ListTile(
                            title: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    color: HexColor("#979797"),
                                    borderRadius: BorderRadius.circular(30.w)),
                                child:
                                    Image.network(_categories[index].imageUrl)),
                            subtitle: Text(
                              _categories[index].nameEn,
                              style:
                                  TextStyle(fontSize: 11.5.sp, color: color1),
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
            // Container(
            //   height: 96.h,
            //   child: ListView.builder(
            //     padding: EdgeInsets.only(left: 10),
            //     itemCount: 5,
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) {
            //       return Container(
            //           width: 85.w,
            //           child: ListTile(
            //             title: Container(
            //                 clipBehavior: Clip.antiAlias,
            //                 decoration: BoxDecoration(
            //                     color: HexColor("#979797"),
            //                     borderRadius: BorderRadius.circular(30.w)),
            //                 child: Image.asset(
            //                   "imageCategories/Gadgets.png",
            //                 )),
            //             subtitle: Text(
            //               "Gadgets",
            //               style: TextStyle(fontSize: 11.5.sp, color: color1),
            //             ),
            //           ));
            //     },
            //   ),
            // ),
            SizedBox(
              height: 20.h,
            ),
            Center(
                child: Text(
              "Recommended For You",
              style: TextStyle(
                  color: color1, fontSize: 16.sp, fontWeight: FontWeight.bold),
            )),
            // Container(
            //   height: 220.h,
            //   width:148.w,
            //   child: ListView(
            //     children: [
            //     SizedBox(
            //    //   height: 220.h,width:148.w,
            //       child: Stack(
            //         children: [
            //            SizedBox(child: Image.asset("image/card1.png")),
            //           // IconButton(
            //           //     onPressed: () {
            //           // }, icon: SvgPicture.asset("imageSvg/Icon_save.svg"))
            //           Align(alignment: AlignmentDirectional.topEnd,child: Container(decoration: BoxDecoration(color: color2,borderRadius: BorderRadius.circular(14.w)),height: 28.h,width: 28.w,child: SvgPicture.asset("imageSvg/Icon_save.svg",fit: BoxFit.scaleDown,),))
            //       ],),
            //     )
            //   ],),
            // ),
            Expanded(
              child: FutureBuilder<List<LatestProducts>>(
                future: _futureP,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
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
                        return Card01(
                          image: _latestProducts[index].imageUrl,
                          name: _latestProducts[index].nameEn,
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
            // Expanded(
            //   // height: 300.h,
            //   child: GridView.builder(
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       mainAxisSpacing: 10,
            //       childAspectRatio: 154 / 220,
            //       //  crossAxisSpacing: 154/220,
            //       crossAxisSpacing: 10,
            //
            //     ),
            //     padding:
            //     const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //     itemCount: 10,
            //     itemBuilder: (context, index) {
            //       return Card01(image: "", name: "",);
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    bool loggedOut = await AuthApiController().logout();
    if (loggedOut) Navigator.pushReplacementNamed(context, '/login_screen');
  }
}

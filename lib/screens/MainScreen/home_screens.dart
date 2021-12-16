import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/screens/MainScreen/NaveScreens/main_screen.dart';
import 'package:scound_project_elancer/screens/MainScreen/NaveScreens/saved_screen.dart';
import 'package:scound_project_elancer/screens/MainScreen/NaveScreens/search_screen.dart';
import 'package:scound_project_elancer/screens/MainScreen/NaveScreens/user_account_screen.dart';
import 'package:scound_project_elancer/widgets/NavButtom/custom_nav_bottom.dart';

import 'NaveScreens/my_cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool main=true;
  bool search=false;
  bool myCard=false;
  bool save=false;
  bool account=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          main?MainScreen():search?SearchScreen():myCard?MyCartScreen():save?SavedScreen():UserAccountScreen(),
          Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w,bottom: 28.h),
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                //margin: EdgeInsets.only(left: 10.w, right: 10.w),
                // width: 562.w,
                height: 60.h,
                decoration: BoxDecoration(
                    color: color1, borderRadius: BorderRadius.circular(30.w)),
                child: Row(
                  children: [
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          main=true;
                          search=false;
                          myCard=false;
                          save=false;
                          account=false;
                        });
                      },
                      icon: Icon(
                        main?Icons.home:Icons.home_outlined,
                        color: main?color2:color3,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          main=false;
                          search=true;
                          myCard=false;
                          save=false;
                          account=false;
                        });
                      },
                      icon: Icon(
                        Icons.search,
                        color: search?color2:color3,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          main=false;
                          search=false;
                          myCard=true;
                          save=false;
                          account=false;
                        });
                      },
                      icon: Icon(
                        myCard?Icons.shopping_basket:Icons.shopping_basket_outlined,
                        color: myCard?color2:color3,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          main=false;
                          search=false;
                          myCard=false;
                          save=true;
                          account=false;
                        });
                      },
                      icon: Icon(
                        Icons.wine_bar_sharp,
                        color: save?color2:color3,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          main=false;
                          search=false;
                          myCard=false;
                          save=false;
                          account=true;
                        });
                      },
                      icon: Icon(
                       account?Icons.person:Icons.person_outline,
                        color: account?color2:color3,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}

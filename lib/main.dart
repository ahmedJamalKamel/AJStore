import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:scound_project_elancer/get/get_all_data_getx_controler.dart';
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';
import 'package:scound_project_elancer/screens/AutScreen/login_screen.dart';
import 'package:scound_project_elancer/screens/AutScreen/password/forget_password_screen.dart';
import 'package:scound_project_elancer/screens/AutScreen/code_active_screen.dart';
import 'package:scound_project_elancer/screens/AutScreen/register_screen.dart';
import 'package:scound_project_elancer/screens/Category/category_screen_op1.dart';
import 'package:scound_project_elancer/screens/Category/category_screen_op11.dart';
import 'package:scound_project_elancer/screens/Category/category_screen_op2.dart';
import 'package:scound_project_elancer/screens/MainScreen/NaveScreens/main_screen.dart';
import 'package:scound_project_elancer/screens/MainScreen/NaveScreens/saved_screen.dart';
import 'package:scound_project_elancer/screens/MainScreen/home_screens.dart';
import 'package:scound_project_elancer/screens/MyAccount/edit_my_account_screen.dart';
import 'package:scound_project_elancer/screens/ProductScreen/single_product_op1.dart';
import 'package:scound_project_elancer/screens/launch_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'database/db_controller.dart';
import 'get/author_getx_controller.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  await DbController().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 final CityrGetxController _authorGetxController = Get.put<CityrGetxController>(CityrGetxController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375,812),
      builder: () {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale("en"),
          initialRoute: '/launch_screen',
          routes: {
            '/launch_screen': (context) => const LaunchScreen(),
            '/login_screen': (context) =>  LoginScreen(),
            '/register_screen': (context) =>  RegisterScreen(),
           // '/reset_password_screen': (context) =>  ResetPasswordScreen(email: "email"),
            '/forget_password_screen': (context) =>  ForgetPasswordScreen(),
            //'/reset_password_screen': (context) =>  ResetPasswordScreen(),
            '/main_screen': (context) =>  MainScreen(),
            '/saved_screen': (context) =>  SavedScreen(),
           // '/category_screen_op11': (context) =>  CategoryScreenOP11(),
            '/category_screen_op1': (context) =>  CategoryScreenOP1(),
            '/home_screen': (context) =>  HomeScreen(),
          //  '/single_product_op1': (context) =>  SingleProductOp1(),
            '/edit_my_account_screen': (context) =>  EditMyAccountScreen(),
          },
        );
      }
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';
import 'package:scound_project_elancer/screens/AutScreen/login_screen.dart';
import 'package:scound_project_elancer/screens/AutScreen/password/forget_password_screen.dart';
import 'package:scound_project_elancer/screens/AutScreen/password/reset_password_screen.dart';
import 'package:scound_project_elancer/screens/AutScreen/register_screen.dart';
import 'package:scound_project_elancer/screens/Category/category_screen_op1.dart';
import 'package:scound_project_elancer/screens/Category/category_screen_op2.dart';
import 'package:scound_project_elancer/screens/MainScreen/main_screen.dart';
import 'package:scound_project_elancer/screens/MainScreen/saved_screen.dart';
import 'package:scound_project_elancer/screens/launch_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
          initialRoute: '/main_screen',
          routes: {
            '/launch_screen': (context) => const LaunchScreen(),
            '/login_screen': (context) =>  LoginScreen(),
            '/register_screen': (context) =>  RegisterScreen(),
           // '/reset_password_screen': (context) =>  ResetPasswordScreen(email: "email"),
            '/forget_password_screen': (context) =>  ForgetPasswordScreen(),
            '/main_screen': (context) =>  MainScreen(),
            '/saved_screen': (context) =>  SavedScreen(),
            '/category_screen_op2': (context) =>  CategoryScreenOp2(),
            '/category_screen_op1': (context) =>  CategoryScreenOP1(),
          },
        );
      }
    );
  }
}


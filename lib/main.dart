import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:scound_project_elancer/get/get_all_data_getx_controler.dart';
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';
import 'package:scound_project_elancer/screens/About/adout_screen.dart';
import 'package:scound_project_elancer/screens/AddressScreen/address_screen.dart';
import 'package:scound_project_elancer/screens/AddressScreen/new_address_screen.dart';
import 'package:scound_project_elancer/screens/AutScreen/login_screen.dart';
import 'package:scound_project_elancer/screens/AutScreen/password/change_password_screen.dart';
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
import 'package:scound_project_elancer/screens/MyAccount/fqa_screen.dart';
import 'package:scound_project_elancer/screens/MyAccount/ticket_screen.dart';
import 'package:scound_project_elancer/screens/OrderScreen/order_view_screen.dart';
import 'package:scound_project_elancer/screens/PayMentScreen/new_payment_card_screen.dart';
import 'package:scound_project_elancer/screens/PayMentScreen/view_payment_card_screen.dart';
import 'package:scound_project_elancer/screens/ProductScreen/single_product_op1.dart';
import 'package:scound_project_elancer/screens/launch_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'database/db_controller.dart';
import 'get/databaseGetx/city_getx_controller.dart';
import 'get/language_getx_controller.dart';
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
  final LanguageGetxController _LanguAllGetxController = Get.put<LanguageGetxController>(LanguageGetxController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375,812),
      builder: () {
        return Obx((){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(_LanguAllGetxController.language.value),
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
              '/fqa_screen': (context) =>  FQAScreen(),
              '/ticket_screen': (context) =>  TicketScreen(),
              '/change_password_screen': (context) =>  ChangePasswordScreen(),
              '/new_address_screen': (context) =>  NewAddressScreen(),
              '/address_screen': (context) =>  AddressScreen(),
              '/new_payment_card_screen': (context) =>  NewCardeScreen(),
              '/view_payment_card_screen': (context) =>  ViewPaymentCardScreen(),
              '/order_view_screen': (context) =>  OrderViewScreen(),
              '/adout_screen': (context) =>  AboutScreen(),
            },
          );
        });
      }
    );
  }
}


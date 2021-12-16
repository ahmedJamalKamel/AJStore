import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            // color: Colors.blue,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white60,
                Colors.white,
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  InkWell(
                    onTap: ()
                    {
                      print("ahmed");
                      Navigator.pop(context);
                      print("ahmed");
                    },
                    child: Container(
                      width: 50,
                        margin: EdgeInsets.only(top: 60.h),
                        height:50,
                        child: Icon(Icons.arrow_back_ios)
                    ),
                  ),
                  Image.asset("image/finalSplash.png"),
                  Card(
                    margin: EdgeInsets.only(bottom: 10.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.w)),
                    elevation: 10,
                    shadowColor: Colors.deepPurple,
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: InkWell(
                        onTap: () => _launchEmail(),
                        child: Text(
                          AppLocalizations.of(context)!.name+' :',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 22.sp,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      subtitle:  Text(AppLocalizations.of(context)!.myName),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async =>
                    {await launch("ahmed.jamal.kamel@gmail.com")},
                    child: Card(
                      margin: EdgeInsets.only(bottom: 10.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.w)),
                      elevation: 10,
                      shadowColor: Colors.deepPurple,
                      child: ListTile(
                        leading: const Icon(Icons.email_sharp),
                        title: InkWell(
                          onTap: () => _launchEmail(),
                          child: Text(
                            AppLocalizations.of(context)!.email+' :',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 22.sp,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        subtitle: const Text('ahmed.jamal.kamel@gmail.com'),
                        trailing: const Icon(
                          Icons.send_sharp,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  GestureDetector(
                    onTap: () async => {await launch("tel:+970597674455")},
                    child: Card(
                      margin: EdgeInsets.only(bottom: 20.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.w)),
                      elevation: 10,
                      shadowColor: Colors.deepPurple,
                      child: ListTile(
                        leading: const Icon(Icons.call),
                        title: Text(
                          AppLocalizations.of(context)!.phone+' :',
                          style: TextStyle(
                            fontFamily: ' fontFamily',
                            fontWeight: FontWeight.normal,
                            fontSize: 22.sp,
                            letterSpacing: 1,
                          ),
                        ),
                        subtitle: const Text('+970597674455'),
                        trailing: const Icon(
                          Icons.phone_android,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.only(bottom: 20.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.w)),
                    elevation: 10,
                    shadowColor: Colors.deepPurple,
                    child: ListTile(
                      leading: const Icon(Icons.note),
                      title: Text(
                        AppLocalizations.of(context)!.project+' :',
                        style: TextStyle(
                          fontFamily: ' fontFamily',
                          fontWeight: FontWeight.normal,
                          fontSize: 22.sp,
                          letterSpacing: 1,
                        ),
                      ),
                      subtitle: const Text('Elancer '),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ]),
          )),
    );
  }
}

_launchEmail() async {
  String email = "ahmed.jamal.kamel@gmail.com";
  if (await canLaunch("mailto:$email")) {
    await launch("mailto:$email");
  } else {
    throw 'Could not launch';
  }
}

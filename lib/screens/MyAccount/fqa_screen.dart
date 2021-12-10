import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controler/qa_api_controller.dart';
import 'package:scound_project_elancer/model/faqs.dart';

class FQAScreen extends StatefulWidget {
  const FQAScreen({Key? key}) : super(key: key);

  @override
  _FQAScreenState createState() => _FQAScreenState();
}

class _FQAScreenState extends State<FQAScreen> {
  late TextEditingController _textEditingController;
  late Future<List<FAQs>> _future;
  List<FAQs> _categories = <FAQs>[];

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _future = QAApiController().getFAQs();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      body: Column(
        children: [
          SizedBox(
            height: 350.h,
            child: Card(
              elevation: 5.w,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15.h),
                    bottomLeft: Radius.circular(15.h)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 55.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                //  margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
                                height: 38.h,
                                width: 38.w,
                                decoration: BoxDecoration(
                                    color: color1,
                                    borderRadius: BorderRadius.circular(19.w)),
                                child: SvgPicture.asset(
                                    "imageSvg/Left_Button_Blake.svg")),
                          ),
                          Text("Support & FAQs"),
                          Container(
                            //    margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
                            height: 38.h,
                            width: 38.w,
                            decoration: BoxDecoration(
                                //   border: Border.all(width: 1.w, color: Colors.grey),
                                borderRadius: BorderRadius.circular(19.w)),
                            // child: const Center(child: Icon(Icons.more_vert)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 53.h,
                    ),
                    Text(
                      "Hello! How can we\n help you?",
                      style: TextStyle(
                          color: color1,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Text(
                      "Press the heart button\n to add an hotel. ",
                      style: TextStyle(color: color3, fontSize: 12.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      child: TextField(
                        controller: _textEditingController,
                        onChanged: (value) {},
                        decoration:
                            const InputDecoration(icon: Icon(Icons.search)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Expanded(
            child: FutureBuilder<List<FAQs>>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  _categories = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: _categories.length,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 30.h),
                        child: ListTile(
                          title: Text(
                            _categories[index].question,
                            style: TextStyle(
                                color: color1,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          subtitle: Container(
                            margin: EdgeInsets.only(top: 16.h),
                            child: Text(
                              _categories[index].answer,
                              style: TextStyle(fontSize: 12.sp, color: color3),
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
        ],
      ),
    );
  }
}

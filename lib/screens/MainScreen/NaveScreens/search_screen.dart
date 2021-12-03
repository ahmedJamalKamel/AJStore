import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/widgets/Card/card11.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController=TextEditingController();
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60.h),
              child:         TextField(
                controller: _textEditingController,
                onChanged: (value) {
                  setState(() {
                  });
                },
                decoration: const InputDecoration(
                    icon: Icon(Icons.search)
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 154 / 114,
                //  crossAxisSpacing: 154/220,
                crossAxisSpacing: 10,
              ),
                itemCount: 5,
                itemBuilder: (context, index) {
                return Card11();
              },),
            )
          ],
        ),
      ),
    );
  }
}

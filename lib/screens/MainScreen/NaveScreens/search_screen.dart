import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/get/get_all_data_getx_controler.dart';
import 'package:scound_project_elancer/model/product_model.dart';
import 'package:scound_project_elancer/screens/Category/category_screen_op11.dart';
import 'package:scound_project_elancer/screens/ProductScreen/single_product_op1.dart';
import 'package:scound_project_elancer/widgets/Card/card11.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _textEditingController;
  List<Product> filterSearch=<Product>[];
  @override
  void initState() {
    _textEditingController=TextEditingController();
  //  AllDataGetxControler.to.getAllProduct();
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
      body: Obx(()
      {
        return !AllDataGetxControler.to.loadingAllProduct.value &&
            AllDataGetxControler.to.Allproduct.value.isNotEmpty
            ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 60.h),
                child:TextField(
                  controller: _textEditingController,
                  onChanged: (value) {
                    setState(() {
                      AllDataGetxControler.to.filterSearch.value.clear();    });
                      for(int i=0;i<AllDataGetxControler.to.Allproduct.value.length;i++)
                      {
                        if(AllDataGetxControler.to.Allproduct.value[i].nameEn.contains(_textEditingController.text))
                        {
                          setState(() {
                            AllDataGetxControler.to.filterSearch.value.add(AllDataGetxControler.to.Allproduct.value[i]);

                          });
                        }
                      }

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
                  itemCount: AllDataGetxControler.to.filterSearch.value.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: ()
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SingleProductOp1(
                                product:  AllDataGetxControler.to.filterSearch.value[index],
                              ),
                            ),
                          );
                        },
                        child: Card11(p: AllDataGetxControler.to.filterSearch.value[index],));
                  },),
              )
            ],
          ),
        ): !AllDataGetxControler.to.loadingAllProduct.value &&
            AllDataGetxControler.to.Allproduct.value.isEmpty
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
            : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}

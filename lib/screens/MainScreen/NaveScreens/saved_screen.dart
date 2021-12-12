import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controler/favorite_api_controller.dart';
import 'package:scound_project_elancer/get/favorite_getx_controller.dart';
import 'package:scound_project_elancer/model/product_model.dart';
import 'package:scound_project_elancer/screens/ProductScreen/single_product_op1.dart';
import 'package:scound_project_elancer/widgets/Card/card04_save.dart';
import 'package:scound_project_elancer/widgets/Card/card_save.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  void initState() {
    FavoriteGetXController.to.getFavorite();
    // TODO: implement initState
    super.initState();
  }

  Product p = Product();
  Product remove = Product();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
        child: Obx(() {
          return Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              // Row(
              //   children: [
              //     Container(
              //       height: 30.h,
              //       width: 79.w,
              //       decoration: BoxDecoration(
              //         color: color2,
              //         borderRadius: BorderRadius.circular(15.w),
              //       ),
              //       child: Center(
              //           child: Text(
              //         "10 items",
              //         style: TextStyle(color: Colors.black),
              //       )),
              //     ),
              //     Container(
              //       height: 30.h,
              //       width: 79.w,
              //       decoration: BoxDecoration(
              //         color: color6,
              //         borderRadius: BorderRadius.circular(15.w),
              //       ),
              //       child: Center(
              //           child: Text(
              //         "10 items",
              //         style: TextStyle(color: Colors.white),
              //       )),
              //     ),
              //     Spacer(),
              //     Container(
              //       margin: EdgeInsets.only(right: 10.w, left: 10.w),
              //       decoration: BoxDecoration(
              //           color: color3.withOpacity(.2),
              //           borderRadius: BorderRadius.circular(18.w)),
              //       height: 38.h,
              //       width: 38.w,
              //       child: SvgPicture.asset(
              //         "imageSvg/Icon_List.svg",
              //         fit: BoxFit.scaleDown,
              //       ),
              //     ),
              //     Container(
              //       //  margin: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
              //       // decoration: BoxDecoration(
              //       //     color: color3.withOpacity(.2),
              //       //     borderRadius: BorderRadius.circular(18.w)),
              //       height: 38.h,
              //       width: 38.w,
              //       child: SvgPicture.asset(
              //         "imageSvg/Button_Icon_Circle.svg",
              //         //fit: BoxFit.scaleDown,
              //       ),
              //     ),
              //   ],
              // ),
              Text(
                "My Favorite",
                style: TextStyle(
                    color: color1,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
              !FavoriteGetXController.to.loadingFavorite.value &&
                      FavoriteGetXController.to.listFavorite.value.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount:
                            FavoriteGetXController.to.listFavorite.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // Product p = Product();
                              p.price = FavoriteGetXController
                                  .to.listFavorite.value[index].price;
                              p.nameEn = FavoriteGetXController
                                  .to.listFavorite.value[index].nameEn;
                              p.imageUrl = FavoriteGetXController
                                  .to.listFavorite.value[index].imageUrl;
                              p.id = FavoriteGetXController
                                  .to.listFavorite.value[index].id;
                              p.infoAr = FavoriteGetXController
                                  .to.listFavorite.value[index].infoAr;
                              p.isFavorite = FavoriteGetXController
                                  .to.listFavorite.value[index].isFavorite;
                              p.infoEn = FavoriteGetXController
                                  .to.listFavorite.value[index].infoEn;
                              p.nameAr = FavoriteGetXController
                                  .to.listFavorite.value[index].nameAr;
                              p.offerPrice = FavoriteGetXController
                                  .to.listFavorite.value[index].offerPrice;
                              p.overalRate = FavoriteGetXController
                                  .to.listFavorite.value[index].overalRate;
                              p.productRate = FavoriteGetXController
                                  .to.listFavorite.value[index].productRate;
                              p.quantity = FavoriteGetXController
                                  .to.listFavorite.value[index].quantity;
                              p.subCategoryId = FavoriteGetXController
                                  .to.listFavorite.value[index].subCategoryId;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SingleProductOp1(
                                    product: p,
                                  ),
                                ),
                              );
                            },
                            child: Dismissible(
                              background: const Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                              key: UniqueKey(),
                              onDismissed: (direction) async {
                                remove.price = FavoriteGetXController
                                    .to.listFavorite.value[index].price;
                                remove.nameEn = FavoriteGetXController
                                    .to.listFavorite.value[index].nameEn;
                                remove.imageUrl = FavoriteGetXController
                                    .to.listFavorite.value[index].imageUrl;
                                remove.id = FavoriteGetXController
                                    .to.listFavorite.value[index].id;
                                remove.infoAr = FavoriteGetXController
                                    .to.listFavorite.value[index].infoAr;
                                remove.isFavorite = FavoriteGetXController
                                    .to.listFavorite.value[index].isFavorite;
                                remove.infoEn = FavoriteGetXController
                                    .to.listFavorite.value[index].infoEn;
                                remove.nameAr = FavoriteGetXController
                                    .to.listFavorite.value[index].nameAr;
                                remove.offerPrice = FavoriteGetXController
                                    .to.listFavorite.value[index].offerPrice;
                                remove.overalRate = FavoriteGetXController
                                    .to.listFavorite.value[index].overalRate;
                                remove.productRate = FavoriteGetXController
                                    .to.listFavorite.value[index].productRate;
                                remove.quantity = FavoriteGetXController
                                    .to.listFavorite.value[index].quantity;
                                remove.subCategoryId = FavoriteGetXController
                                    .to.listFavorite.value[index].subCategoryId;
                                await FavoriteApiController().setFavorite(
                                    context,
                                    idProduct: remove.id.toString());
                              },
                              child: Card04Save(favorite: FavoriteGetXController.to.listFavorite[index],)
                              // CardSave(
                              //   favorite: FavoriteGetXController
                              //       .to.listFavorite[index],
                              // ),
                            ),
                          );
                        },
                      ),
                    )
                  : !FavoriteGetXController.to.loadingFavorite.value &&
                          FavoriteGetXController.to.listFavorite.value.isEmpty
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
                      : Center(child: CircularProgressIndicator())
            ],
          );
        }),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:scound_project_elancer/Them/colors.dart';
import 'package:scound_project_elancer/api/controler/favorite_api_controller.dart';
import 'package:scound_project_elancer/api/controler/user_api_controller.dart';
import 'package:scound_project_elancer/get/databaseGetx/order_getx_controller.dart';
import 'package:scound_project_elancer/get/favorite_getx_controller.dart';
import 'package:scound_project_elancer/get/get_all_data_getx_controler.dart';
import 'package:scound_project_elancer/helpers/helpers.dart';
import 'package:scound_project_elancer/model/ProductDetails/opject_prodict.dart';
import 'package:scound_project_elancer/model/model_cart_database.dart';
import 'package:scound_project_elancer/model/product_model.dart';
import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

class SingleProductOp1 extends StatefulWidget {
  SingleProductOp1({Key? key, required this.product}) : super(key: key);
  Product product;

  @override
  _SingleProductOp1State createState() => _SingleProductOp1State();
}

class _SingleProductOp1State extends State<SingleProductOp1> with Helpers{
  late bool isfavorite;
//  late final _ratingController;
  late double _rating;
  double _initialRating = 0.0;
  void getdata()
 async {
   await  AllDataGetxControler.to.getDitilesProduct(widget.product.id.toString());
    isfavorite =  AllDataGetxControler.to.isfavertD.value;
  }
  @override
  void initState() {
    getdata();
    _rating = _initialRating;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      body: Obx(() {
        if (!AllDataGetxControler.to.ditilesloding.value &&
            AllDataGetxControler.to.ditiles != null) {
            _initialRating=AllDataGetxControler.to.ditiles.productRate.toDouble();
          return Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 100.h),
                  height: 300.h,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 300.h,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      // viewportFraction: 0.9,
                      aspectRatio: 2.0,
                      initialPage: 2,
                    ),
                    itemCount: AllDataGetxControler.to.ditiles.images.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      height: 202.h,
                      width: 319.w,
                      child: Image.network(
                        AllDataGetxControler
                            .to.ditiles.images[itemIndex].imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin:
                            EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
                        height: 38.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                            //     color: color2,
                            borderRadius: BorderRadius.circular(19.w)),
                        child:
                            SvgPicture.asset("imageSvg/Left_Button_Blake.svg"),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          isfavorite = !isfavorite;
                        });
                        await FavoriteApiController().setFavorite(context,
                            idProduct: widget.product.id.toString());
                        // setState(() {
                        AllDataGetxControler.to.isfavertD.value =
                            !AllDataGetxControler.to.isfavertD.value;
                        // widget.product.isFavorite=!widget.product.isFavorite;
                        // });
                      },
                      child: Container(
                        padding: EdgeInsets.zero,
                        margin:
                            EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
                        child: isfavorite ||
                                AllDataGetxControler.to.isfavertD.value
                            ? Icon(
                                Icons.favorite_outlined,
                                size: 38.w,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_outline_sharp,
                                size: 38.w,
                              ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  height: 400.h,
                  width: 400.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.w),
                          topRight: Radius.circular(20.w))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        Center(
                          child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.w)),
                              width: 48.w,
                              height: 5.h,
                              child: Divider(
                                thickness: 5.h,
                                color: color3,
                              )),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                            title: Text(
                          AllDataGetxControler.to.ditiles.name,
                          style: TextStyle(
                              color: color1,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold),
                        ),
                            trailing: IconButton(icon: Icon(Icons.star),onPressed: ()=>dialogRate(),),
                        ),
                        Text(
                          AllDataGetxControler.to.ditiles.price.toString() +
                              " \$",
                          style: TextStyle(color: color3, fontSize: 12.sp),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(AllDataGetxControler.to.ditiles.overalRate
                                  .toString()),
                              Container(
                                child: RatingBarIndicator(
                                  rating: AllDataGetxControler
                                      .to.ditiles.overalRate
                                      .toDouble(),
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 10.0.w,
                                  unratedColor: Colors.amber.withAlpha(50),
                                  direction: Axis.horizontal,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "5,1k reviews",
                                style:
                                    TextStyle(color: color3, fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Container(
                          child: Text(
                            AllDataGetxControler.to.ditiles.info,
                            style: TextStyle(color: color1, fontSize: 20.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: InkWell(
                  onTap: (){
                    bool ex=false;
                    OrderData order=OrderData();
                    order.nameEn=widget.product.nameEn;
                    order.nameAr=widget.product.nameAr;
                    order.price=widget.product.price.toString();
                    order.image=widget.product.imageUrl;
                    order.prodictId=widget.product.id;
                    order.userId=SharedPrefController().userID;
                //    order.userId=widget.product.;
                    order.cont=1;
                    List<OrderData> o=OrderGetxController.to.order.value;
                    for(int i=0;i<o.length;i++)
                    {
                      if(o[i].prodictId==order.prodictId)
                      {
                        setState(() {
                          ex=true;
                        });
                        break;
                      }
                    }
                    if(!ex)OrderGetxController.to.createContact(order);
                    else{                 showSnackBar(
                      context: context,
                      message: 'this item is alredy exist',
                      error: true,
                    );

                    }
                 // final  ex = OrderGetxController.to.order.value.where((element) =>element.nameEn==order.nameEn);
                 //    if(ex.isNotEmpty) {
                 //      OrderGetxController.to.createContact(order);
                 //    } else{
                 //      showSnackBar(
                 //        context: context,
                 //        message: 'this item is alredy exist',
                 //        error: true,
                 //      );
                 //    }

                  },
                  child: Container(
                    margin:
                        EdgeInsets.only(left: 20.w, right: 20.w, bottom: 28.h),
                    width: 207.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        color: color1, borderRadius: BorderRadius.circular(30.w)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 21.w,
                        ),
                        Text(
                          "Add to Cart",
                          style: TextStyle(color: color2),
                        ),
                        Spacer(),
                        Container(
                            height: 38.h,
                            width: 38.w,
                            decoration: BoxDecoration(
                                color: HexColor("#979797"),
                                borderRadius: BorderRadius.circular(18.w)),
                            child: Center(
                                child: Text(
                                  OrderGetxController.to.order.length.toString(),
                              style: TextStyle(color: color2),
                            ))),
                        SizedBox(
                          width: 21.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return !AllDataGetxControler.to.ditilesloding.value &&
                  AllDataGetxControler.to.ditiles == null
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
              : Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
  void dialogRate()
  {
   // CupertinoAlertDialog
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Rate Product'),
        content: _ratingBar(),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async=>await RateProduct(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _ratingBar() {
        return RatingBar.builder(
          initialRating: _initialRating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          unratedColor: Colors.amber.withAlpha(50),
          itemCount: 5,
          itemSize: 30.0,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
  }
  Future<void> RateProduct() async {
    bool status = await UserApiController().RateProduct(context,
        productId: widget.product.id.toString(),
        rate:  _rating.toString());
    if (status) {
      AllDataGetxControler.to.getDitilesProduct(widget.product.id.toString());
      Navigator.pop(context, 'Ok');
    }
  }
}

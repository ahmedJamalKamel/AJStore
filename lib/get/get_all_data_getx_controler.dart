
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:scound_project_elancer/api/controler/home_api_controller.dart';
import 'package:scound_project_elancer/api/controler/user_api_controller.dart';
import 'package:scound_project_elancer/model/HomeMobel/famous_product.dart';
import 'package:scound_project_elancer/model/HomeMobel/lastest_products.dart';
import 'package:scound_project_elancer/model/HomeMobel/slider.dart';
import 'package:scound_project_elancer/model/ProductDetails/opject_prodict.dart';
import 'package:scound_project_elancer/model/list_cat.dart';
import 'package:scound_project_elancer/model/product_model.dart';
import 'package:scound_project_elancer/model/sup_categories.dart';

class AllDataGetxControler extends GetxController
{


  RxList<SupCategory> supCategory = <SupCategory>[].obs;
  RxList<ListCat> categories = <ListCat>[].obs;
  RxList<Product> product = <Product>[].obs;
  RxBool loadingsupCategory = false.obs;
  RxBool loadingCategory = false.obs;
  RxBool loadingProduct = false.obs;

  final UserApiController _apiController=UserApiController();
  final HomeApiController _homeApiController=HomeApiController();
  /////////////////// prodct
  //RxList<Product> prouduct=<Product>[].obs;
  // RxBool loding=false.obs;
  static AllDataGetxControler get to => Get.find<AllDataGetxControler>();
  void data()
  async{
    loadingCategory.value=true;
    loadingLatestProducts.value=true;
    loadingSliderModel.value=true;
    // lo.value=true;

    await getLatestProducts();
    await getSliderModel();
    await getCategory();
    await getAllProduct();
    await  getFamesceProducts();

  //  await AllDataGetxControler.to.getAllProduct();
  }
  @override
  void onInit() {
  //  getCategory();
    // //getSupCategory();
    data();
    super.onInit();
  } //CRUD

  Future<void> getSupCategory1(String id) async {
    loadingsupCategory = true.obs;
    supCategory.value.clear();
   //
    supCategory.value= await _apiController.getSupCategories(id);
    loadingsupCategory.value = false;
    print("getSupCategory1"+supCategory.value.length.toString());
    // notifyListeners();
    // update();
  }
  Future<void> getCategory() async {
    loadingCategory.value = true;
    categories.value = await _apiController.getCategories();
    loadingCategory.value = false;
    // notifyListeners();
    // update();
  }
  Future<void> getProduct(String id) async {
    loadingProduct.value = true;
    product.value = await _apiController.getProduct(id);
    loadingProduct.value = false;
    // notifyListeners();
    // update();
  }
  ////// get All Product
  RxList<Product> Allproduct = <Product>[].obs;
  RxBool loadingAllProduct = false.obs;
  RxList<SupCategory> allSupCategory = <SupCategory>[].obs;
  RxList<Product> filterSearch=<Product>[].obs;
  Future<void> getAllProduct() async {
  //  allSupCategory.clear();
    Allproduct.clear();
    loadingAllProduct.value = true;
    categories.value = await _apiController.getCategories();
      for(int i=0;i<categories.length;i++)
      {
        supCategory.value= await _apiController.getSupCategories(categories.value[i].id.toString());
       // getSupCategory1();
        for(int j=0;j<supCategory.length;j++)
        {
          Allproduct.value.addAll(await _apiController.getProduct(supCategory.value[j].id.toString()));
        }
        // allSupCategory.value.addAll(await _apiController.getSupCategories(categories[i].id.toString())) ;
      }
      loadingAllProduct.value = false;


    // notifyListeners();
    // update();
  }
//////////////////////////// Home Data
  ////latestProducts
  RxList<LatestProducts> latestProducts = <LatestProducts>[].obs;
  RxBool loadingLatestProducts=false.obs;
  Future<void> getLatestProducts() async {
    loadingLatestProducts.value = true;
    latestProducts.value = await _homeApiController.getDataLatestProducts();
    loadingLatestProducts.value = false;
    // notifyListeners();
    // update();
  }

  RxList<FamousProducts> FamesceProducts = <FamousProducts>[].obs;
  RxBool loadingFamesceProducts=false.obs;
  Future<void> getFamesceProducts() async {
    loadingFamesceProducts.value = true;
    FamesceProducts.value = await _homeApiController.getDataFamousProduct();
    loadingFamesceProducts.value = false;
    // notifyListeners();
    // update();
  }
  ////sliderModel
  RxList<SliderModel> sliderModel = <SliderModel>[].obs;
  RxBool loadingSliderModel=false.obs;
  Future<void> getSliderModel() async {
    loadingSliderModel.value = true;
    sliderModel.value = await _homeApiController.getDataSlider();
    loadingSliderModel.value = false;
    // notifyListeners();
    // update();
  }
//////////////////////////
//   RxMap  ditiles = ObjectPr as RxMap;
  ObjectPr ditiles=ObjectPr();
  RxBool ditilesloding=false.obs;
  RxBool isfavertD=false.obs;
  Future<void> getDitilesProduct(String id) async {
    ditilesloding.value = true;
    ditiles = (await _apiController.getProductDitales(id))!;
    ditilesloding.value = false;
    isfavertD.value=ditiles.isFavorite;
    // notifyListeners();
     update();
  }


}

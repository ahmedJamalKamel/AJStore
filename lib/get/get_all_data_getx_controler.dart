
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:scound_project_elancer/api/controler/home_api_controller.dart';
import 'package:scound_project_elancer/api/controler/user_api_controller.dart';
import 'package:scound_project_elancer/model/HomeMobel/lastest_products.dart';
import 'package:scound_project_elancer/model/HomeMobel/slider.dart';
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

  static AllDataGetxControler get to => Get.find<AllDataGetxControler>();
  @override
  void onInit() {
    getCategory();
    getSupCategory();
    getLatestProducts();
    getSliderModel();
    super.onInit();
  } //CRUD

  Future<void> getSupCategory() async {
    loadingsupCategory.value = true;
    for(int i=0;i<categories.value.length;i++)
    {
      supCategory.value.addAll(await _apiController.getSupCategories(categories.value[i].id.toString()));
    }
    //city.value = await _apiController.getSupCategories(idcat);
    loadingsupCategory.value = false;
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



}

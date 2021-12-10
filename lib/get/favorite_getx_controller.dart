
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:scound_project_elancer/api/controler/favorite_api_controller.dart';
import 'package:scound_project_elancer/model/Favorite/favorite.dart';

class FavoriteGetXController extends GetxController
{
  RxList<Favorite> listFavorite=<Favorite>[].obs;
  RxBool loadingFavorite = false.obs;
  final FavoriteApiController _apiController=FavoriteApiController();
static FavoriteGetXController get to  => Get.find<FavoriteGetXController>();
@override
  void onInit() {
    getFavorite();
    // TODO: implement onInit
    super.onInit();
  }
  Future<void> getFavorite() async {
    loadingFavorite.value = true;
    listFavorite.value = await _apiController.getFavorite();
    loadingFavorite.value = false;
    // notifyListeners();
    // update();
  }


}
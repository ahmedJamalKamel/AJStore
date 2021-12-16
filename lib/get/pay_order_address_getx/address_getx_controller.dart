
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:scound_project_elancer/api/controler/favorite_api_controller.dart';
import 'package:scound_project_elancer/api/controlerPayment/api_addresses_controler.dart';
import 'package:scound_project_elancer/model/Favorite/favorite.dart';
import 'package:scound_project_elancer/model/ModelPayment/addresses_model.dart';

class AddressGetXController extends GetxController
{
  RxList<Addresses> listAddress=<Addresses>[].obs;
  RxBool loadingAddress = false.obs;
  final ApiAddressesController _apiController=ApiAddressesController();
  static AddressGetXController get to  => Get.find<AddressGetXController>();
  @override
  void onInit() {
    getAllAddress();
    // TODO: implement onInit
    super.onInit();
  }
  Future<void> getAllAddress() async {
    loadingAddress.value = true;
    listAddress.value = await _apiController.getAddresses();
    loadingAddress.value = false;
    // notifyListeners();
    // update();
  }


}
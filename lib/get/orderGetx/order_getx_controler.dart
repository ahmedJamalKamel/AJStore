import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:scound_project_elancer/api/controler/favorite_api_controller.dart';
import 'package:scound_project_elancer/api/controlerPayment/api_addresses_controler.dart';
import 'package:scound_project_elancer/api/controlerPayment/api_orders_controler.dart';
import 'package:scound_project_elancer/api/controlerPayment/api_payment_cards_controler.dart';
import 'package:scound_project_elancer/model/Favorite/favorite.dart';
import 'package:scound_project_elancer/model/ModelPayment/addresses_model.dart';
import 'package:scound_project_elancer/model/ModelPayment/card_payment_model.dart';
import 'package:scound_project_elancer/model/ModelPayment/order_model_view.dart';

class OrderGetXController extends GetxController
{
  RxList<OrderModelView> listOrder=<OrderModelView>[].obs;
  RxBool loadingOrder = false.obs;
  final ApiOrderController _apiController=ApiOrderController();
  static OrderGetXController get to  => Get.find<OrderGetXController>();
  @override
  void onInit() {
    getAllOrder();
    // TODO: implement onInit
    super.onInit();
  }
  Future<void> getAllOrder() async {
    loadingOrder.value = true;
    listOrder.value = await _apiController.getOrder();
    loadingOrder.value = false;
    // notifyListeners();
    // update();
  }


}
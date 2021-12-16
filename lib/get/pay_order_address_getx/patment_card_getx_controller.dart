import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:scound_project_elancer/api/controler/favorite_api_controller.dart';
import 'package:scound_project_elancer/api/controlerPayment/api_addresses_controler.dart';
import 'package:scound_project_elancer/api/controlerPayment/api_payment_cards_controler.dart';
import 'package:scound_project_elancer/model/Favorite/favorite.dart';
import 'package:scound_project_elancer/model/ModelPayment/addresses_model.dart';
import 'package:scound_project_elancer/model/ModelPayment/card_payment_model.dart';

class PaymentCardGetXController extends GetxController
{
  RxList<PaymentCard> listPaymentCard=<PaymentCard>[].obs;
  RxBool loadingPaymentCard = false.obs;
  final ApiPaymentController _apiController=ApiPaymentController();
  static PaymentCardGetXController get to  => Get.find<PaymentCardGetXController>();
  @override
  void onInit() {
    getAllPaymentCard();
    // TODO: implement onInit
    super.onInit();
  }
  Future<void> getAllPaymentCard() async {
    loadingPaymentCard.value = true;
    listPaymentCard.value = await _apiController.getPayment();
    loadingPaymentCard.value = false;
    // notifyListeners();
    // update();
  }


}
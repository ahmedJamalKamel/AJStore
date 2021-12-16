
import 'package:get/get.dart';
import 'package:scound_project_elancer/database/controllers/cities_db_controller.dart';
import 'package:scound_project_elancer/database/controllers/order_db_controller.dart';
import 'package:scound_project_elancer/model/city.dart';
import 'package:scound_project_elancer/model/model_cart_database.dart';
import 'package:scound_project_elancer/model/model_city_todata.dart';

class OrderGetxController extends GetxController {
  RxList<OrderData> order = <OrderData>[].obs;
  RxBool loading = false.obs;
  final OrderDbController _topicDbController = OrderDbController();

  static OrderGetxController get to => Get.find<OrderGetxController>();

  @override
  void onInit() {
    readContacts();
    super.onInit();
  } //CRUD

  Future<void> readContacts() async {
    loading.value = true;
    order.value = await _topicDbController.read();
    loading.value = false;
    // notifyListeners();
    // update();
  }

  Future<bool> createContact(OrderData topic) async {
    print("createContact");
    int newRowId = await _topicDbController.create(topic);
    if (newRowId != 0) {
      topic.id = newRowId;
      order.add(topic);
      // notifyListeners();
      // update();
    }
    return newRowId != 0;
  }

  Future<bool> deleteContact(int id) async {
    bool deleted = await _topicDbController.delete(id);
    if (deleted) {
      // contacts.removeWhere((element) => element.id == id);
      int index = order.indexWhere((element) => element.id == id);
      if (index != -1) {
        order.removeAt(index);
        // notifyListeners();
        // update();
      }
    }
    return deleted;
  }
  Future<void> deleteContactForUser(int id) async {
    //bool deleted;
      for(int i=0;i<order.length;i++)
      {
        if(order[i].userId==id)
        {
          await deleteContact(order[i].id);
        }
      }
    // return deleted;
    }
  Future<bool> updateContact(OrderData topic) async {
    bool updated = await _topicDbController.update(topic);
    if (updated) {
      // int index = contacts.indexOf(contact);
      int index = order.indexWhere((element) => element.id == topic.id);
      if (index != -1) {
        order[index] = topic;
        // notifyListeners();
        // update();
      }
    }
    return updated;
  }
  }






import 'package:get/get.dart';
import 'package:scound_project_elancer/database/controllers/cities_db_controller.dart';
import 'package:scound_project_elancer/model/city.dart';
import 'package:scound_project_elancer/model/model_city_todata.dart';

class CityrGetxController extends GetxController {
  RxList<CityData> city = <CityData>[].obs;
  RxBool loading = false.obs;
  final CityDbController _topicDbController = CityDbController();

  static CityrGetxController get to => Get.find<CityrGetxController>();

  @override
  void onInit() {
    readContacts();
    super.onInit();
  } //CRUD

  Future<List<CityData>> readContacts() async {
    loading.value = true;
   return city.value = await _topicDbController.read();
    loading.value = false;
    // notifyListeners();
    // update();
  }

  Future<bool> createContact(CityData topic) async {
    print("createContact");
    int newRowId = await _topicDbController.create(topic);
    if (newRowId != 0) {
      topic.id = newRowId;
      city.add(topic);
      // notifyListeners();
      // update();
    }
    return newRowId != 0;
  }

  Future<bool> deleteContact(int id) async {
    bool deleted = await _topicDbController.delete(id);
    if (deleted) {
      // contacts.removeWhere((element) => element.id == id);
      int index = city.indexWhere((element) => element.id == id);
      if (index != -1) {
        city.removeAt(index);
        // notifyListeners();
        // update();
      }
    }
    return deleted;
  }

  Future<bool> updateContact(CityData topic) async {
    bool updated = await _topicDbController.update(topic);
    if (updated) {
      // int index = contacts.indexOf(contact);
      int index = city.indexWhere((element) => element.id == topic.id);
      if (index != -1) {
        city[index] = topic;
        // notifyListeners();
        // update();
      }
    }
    return updated;
  }

}

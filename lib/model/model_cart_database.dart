import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

class OrderData{
  late int id;
  late int cont;
  late int prodictId;
  late String nameEn;
  late String nameAr;
  late String price;
  late String image;


  OrderData();
  String get name =>SharedPrefController().language=="ar"?nameAr:nameEn;
  // OrderData.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   nameEn = json['name_en'];
  //   nameAr = json['name_ar'];
  // }
  OrderData.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    cont = json['cont'];
    nameEn = json['nameEn'];
    nameAr = json['nameAr'];
    price = json['price'];
    image = json['image'];
    prodictId = json['prodictId'];
  }

  ///Used to save data in a database table.
  Map<String, dynamic> toMap() {
    Map<String, dynamic> rowMap = <String, dynamic>{};
    rowMap['nameEn'] = nameEn;
    rowMap['nameAr'] = nameAr;
    rowMap['price'] = price;
    rowMap['image'] = image;
    rowMap['cont'] = cont;
    rowMap['prodictId'] = prodictId;
    return rowMap;
  }
}
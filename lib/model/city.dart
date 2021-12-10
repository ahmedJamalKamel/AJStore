import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

class City {
  late int id;
  late String nameEn;
  late String nameAr;

  City();
  String get name =>SharedPrefController().language=="ar"?nameAr:nameEn;
  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }
  City.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['nameEn'];
    nameAr = json['nameEn'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> rowMap = <String, dynamic>{};
   // rowMap['id'] = id;
    rowMap['nameEn'] = nameEn;
    rowMap['nameAr'] = nameAr;
    return rowMap;
  }
}
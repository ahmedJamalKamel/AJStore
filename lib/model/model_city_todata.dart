import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

class CityData{
  late int id;
  late String nameEn;
  late String nameAr;

  CityData();
  String get name =>SharedPrefController().language=="ar"?nameAr:nameEn;
  CityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }
  CityData.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['nameEn'];
    nameAr = json['nameEn'];
  }

  ///Used to save data in a database table.
  Map<String, dynamic> toMap() {
    Map<String, dynamic> rowMap = <String, dynamic>{};
    rowMap['nameEn'] = nameEn;
    rowMap['nameAr'] = nameAr;
    return rowMap;
  }
}
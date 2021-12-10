import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

class SubCategory {
 late int id;
 late String nameEn;
 late String nameAr;
 late int categoryId;
 late String image;
 late String imageUrl;


 String get name =>SharedPrefController().language=="ar"?nameAr:nameEn;
  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    categoryId = json['category_id'];
    image = json['image'];
    imageUrl = json['image_url'];
  }

}
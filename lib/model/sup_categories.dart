import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

class SupCategory {
 late int id;
 late String nameEn;
 late String nameAr;
 late int categoryId;
 late String image;
 late int productsCount;
 late String imageUrl;

 String get name =>SharedPrefController().language=="ar"?nameAr:nameEn;

  SupCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    categoryId = json['category_id'];
    image = json['image'];
    productsCount = json['products_count'];
    imageUrl = json['image_url'];
  }

}
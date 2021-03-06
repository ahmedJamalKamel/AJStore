import 'package:scound_project_elancer/prefs/shared_pref_controller.dart';

class ListCat {
 late int id;
 late String nameEn;
 late String nameAr;
 late String image;
 late int productsCount;
 late int subCategoriesCount;
 late String imageUrl;
  String get name =>SharedPrefController().language=="ar"?nameAr:nameEn;
  ListCat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    image = json['image'];
    productsCount = json['products_count'];
    subCategoriesCount = json['sub_categories_count'];
    imageUrl = json['image_url'];
  }

}
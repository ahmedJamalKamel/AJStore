import 'package:scound_project_elancer/model/HomeMobel/categories_home.dart';
import 'package:scound_project_elancer/model/HomeMobel/slider.dart';

import 'famous_product.dart';
import 'lastest_products.dart';

class Data {
 late List<Slider> slider;
 late List<CategoriesHome> categories;
 late List<LatestProducts> latestProducts;
 late List<FamousProducts> famousProducts;

  // Data(
  //     {this.slider, this.categories, this.latestProducts, this.famousProducts});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider = <Slider>[];
      json['slider'].forEach((v) {
        slider.add(new Slider.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <CategoriesHome>[];
      json['categories'].forEach((v) {
        categories.add(new CategoriesHome.fromJson(v));
      });
    }
    if (json['latest_products'] != null) {
      latestProducts = <LatestProducts>[];
      json['latest_products'].forEach((v) {
        latestProducts.add(new LatestProducts.fromJson(v));
      });
    }
    if (json['famous_products'] != null) {
      famousProducts = <FamousProducts>[];
      json['famous_products'].forEach((v) {
        famousProducts.add(new FamousProducts.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.slider != null) {
  //     data['slider'] = this.slider.map((v) => v.toJson()).toList();
  //   }
  //   if (this.categories != null) {
  //     data['categories'] = this.categories.map((v) => v.toJson()).toList();
  //   }
  //   if (this.latestProducts != null) {
  //     data['latest_products'] =
  //         this.latestProducts.map((v) => v.toJson()).toList();
  //   }
  //   if (this.famousProducts != null) {
  //     data['famous_products'] =
  //         this.famousProducts.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

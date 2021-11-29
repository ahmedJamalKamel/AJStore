import 'package:scound_project_elancer/model/list_cat.dart';

class Categories {
 late bool status;
 late String message;
 late List<ListCat> list;

  // Categories({this.status, this.message, this.list});

  Categories.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['list'] != null) {
      list = <ListCat>[] ;
      json['list'].forEach((v) {
        list.add(ListCat.fromJson(v));
      });
    }
  }

}
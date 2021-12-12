import 'package:scound_project_elancer/model/city.dart';

class Addresses {
 late int id;
 late String name;
 late String info;
 late String contactNumber;
 late Null lat;
 late Null lang;
 late int cityId;
 late City city;


 Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    info = json['info'];
    contactNumber = json['contact_number'];
    lat = json['lat'];
    lang = json['lang'];
    cityId = json['city_id'];
    city = (json['city'] != null ? new City.fromJson(json['city']) : null)!;
  }


}

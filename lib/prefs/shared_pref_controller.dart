
import 'dart:convert';

import 'package:scound_project_elancer/model/model_city_todata.dart';
import 'package:scound_project_elancer/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { userId,lang,loggedIn, fullName, phone, gender, token ,city,cityNameEn,cityNameAr,cityNameId,imagePath,imagePathSelect,}

class SharedPrefController {
  static final SharedPrefController _instance = SharedPrefController._();

  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }
  Future<void> setImage(String path)async{
    await _sharedPreferences.setString(PrefKeys.imagePath.toString(), path);
    await _sharedPreferences.setBool(PrefKeys.imagePathSelect.toString(), true);
    print("ahmed"+imagePathS);
  }
 // String get imagePathS =>_sharedPreferences.getString(PrefKeys.imagePath.toString())??"";
  String get imagePathS {
    print("imagePathS"+_sharedPreferences.getString(PrefKeys.imagePath.toString()).toString());
    return _sharedPreferences.getString(PrefKeys.imagePath.toString())??"";
  }
  bool get selectPath => _sharedPreferences.getBool(PrefKeys.imagePathSelect.toString()) ?? false;
  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
  Future<void> setLanguage({required String lang}) async {
    await _sharedPreferences.setString(PrefKeys.lang.toString(), lang);
  }
  Future<void> setCityCreated() async {
    await _sharedPreferences.setBool(PrefKeys.city.toString(),true);
  }
  String get language => _sharedPreferences.getString(PrefKeys.lang.toString()) ?? 'en';
  Future<void> save({required User student}) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.toString(), true);
    await _sharedPreferences.setString(
        PrefKeys.fullName.toString(), student.name);
    await _sharedPreferences.setString(
        PrefKeys.phone.toString(), student.mobile);
    await _sharedPreferences.setString(
        PrefKeys.gender.toString(), student.gender);
    await _sharedPreferences.setString(PrefKeys.token.toString(), 'Bearer ' + student.token);
    await _sharedPreferences.setString(PrefKeys.cityNameEn.toString(), student.city.nameEn);
    await _sharedPreferences.setString(PrefKeys.cityNameAr.toString(), student.city.nameAr);
    await _sharedPreferences.setString(PrefKeys.cityNameId.toString(), student.city.id.toString());
    await _sharedPreferences.setInt(PrefKeys.userId.toString(), student.id);
  }
  Future<void> updateProfile({required String fullname,required String genderM,required CityData cityData})async
  {
    await _sharedPreferences.setString(
        PrefKeys.fullName.toString(), fullname);
    await _sharedPreferences.setString(
        PrefKeys.gender.toString(), genderM);
    await _sharedPreferences.setString(PrefKeys.cityNameEn.toString(), cityData.nameEn);
    await _sharedPreferences.setString(PrefKeys.cityNameId.toString(), cityData.id.toString());
    await _sharedPreferences.setString(PrefKeys.cityNameAr.toString(), cityData.nameAr);
  }
  Future<void>logout()
  async{
    await _sharedPreferences.setBool(PrefKeys.loggedIn.toString(), false);
 //   await _sharedPreferences.setBool(PrefKeys.city.toString(), false);

  }
  String get fullName =>_sharedPreferences.getString(PrefKeys.fullName.toString())??"";
  String get phone =>_sharedPreferences.getString(PrefKeys.phone.toString())??"";
  String get gender =>_sharedPreferences.getString(PrefKeys.gender.toString())??"";
  int  get userID =>_sharedPreferences.getInt(PrefKeys.userId.toString())??0;
  // String get cityNameId =>_sharedPreferences.getString(PrefKeys.cityNameId.toString())??"";

  bool get loggedIn => _sharedPreferences.getBool(PrefKeys.loggedIn.toString()) ?? false;
  bool get createdCity =>  _sharedPreferences.getBool(PrefKeys.city.toString()) ?? false;

  String get token =>
      _sharedPreferences.getString(PrefKeys.token.toString()) ?? '';

  // Future<bool> clear() async {
  //   return await _sharedPreferences.clear();
  // }
  CityData get ugetCity
  {
    CityData cityData=CityData();
    cityData.nameAr=_sharedPreferences.getString(PrefKeys.cityNameAr.toString())??"";
    cityData.nameEn=_sharedPreferences.getString(PrefKeys.cityNameEn.toString())??"";
    cityData.id=int.parse((_sharedPreferences.getString(PrefKeys.cityNameId.toString())??"1"));

    return cityData;
  }
}

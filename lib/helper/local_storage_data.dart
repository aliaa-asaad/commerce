import 'dart:convert';
import '../constance.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class LocalStorageData extends GetxController {
  Future<UserModel?> get getUser async {
    try {
      UserModel userModel = await _getUserData();
      if (userModel == null) return null;
      return userModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  _getUserData() async {
    SharedPreferences? pref = await SharedPreferences.getInstance();
    var value = pref.getString(CHACHED_USER_DATA);
    return UserModel.fromJson(json.decode(value!));
  }

  setUser(UserModel userModel) async {
    SharedPreferences? pref = await SharedPreferences.getInstance();
    await pref.setString(CHACHED_USER_DATA, json.encode(userModel.toJson()));
  }
  void deleteUser()async{
    SharedPreferences? pref = await SharedPreferences.getInstance();
await pref.clear();
  }
}

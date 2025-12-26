import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:newset/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheUserRepo {
  static Future<void> saveUser(UserModel user)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String,dynamic> userMap = {
      "email":user.email,
      "password":user.password,
      "confirmPassword":user.confirmPassword,
    };
    prefs.setString("user", jsonEncode(userMap));
  }
  static Future<UserModel?>getUser()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsString = prefs.getString("user");
    if (jsString == null) {
      return null;
    }
    Map<String,dynamic> data = jsonDecode(jsString);
    return UserModel(
      email: data["email"],
      password: data["password"],
      confirmPassword: data["confirmPassword"],
    );
  }
  static Future<bool?>getBool(String key)async{
    final prefs=await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
  static Future<void>setBool(String key,bool value)async{
    final prefs=await SharedPreferences.getInstance();
    await prefs.setBool(key,value);
  }
}
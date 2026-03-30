import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_data.dart';

class StorageService {
  static const key = "user_data";

  static Future<void> saveUser(UserData data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(data.toJson()));
  }

  static Future<UserData?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(key);
    if (data == null) return null;
    return UserData.fromJson(jsonDecode(data));
  }

  static Future<bool> isSetupDone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}
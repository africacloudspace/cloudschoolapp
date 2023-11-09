import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class StorageService {
  //Save in storage
  Future<bool> setItem(String dataKey, String dataSet) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(dataKey, dataSet);
  }

  Future<bool> setBool(String dataKey, bool dataSet) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(dataKey, dataSet);
  }

  Future<bool?> getBool(String dataKey) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(dataKey) != null) {
      return prefs.getBool(dataKey) ?? false;
    } else {
      return null;
    }
  }

  Future<bool> removeBool(String dataKey) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(dataKey);
  }

  Future<bool> containsBool(String dataKey) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(dataKey);
  }

  //Get from storage
  Future<String> getItem(String dataKey) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.get(dataKey) != null) {
      return prefs.getString(dataKey) ?? '';
    } else {
      return '';
    }
  }

  //Delete from storage
  Future<bool> removeItem(String dataKey) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(dataKey);
  }

  Future<bool> containsKey(String dataKey) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(dataKey);
  }
}

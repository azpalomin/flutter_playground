import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shared/constants/utils/preferences_constants.dart';
import 'package:flutter_shared/types/user/full_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static Future<void> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<FullUser?> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(currentUserKey);
    if (userJson == null) {
      return null;
    }
    Map<String, dynamic> userMap = jsonDecode(userJson);
    return FullUser.fromJson(userMap);
  }

  static Future<String?> getRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(rememberMeKey);
  }

  static Future<ThemeMode> getThemeModePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeModePref = prefs.getString(themeModeKey);
    return ThemeMode.values.firstWhereOrNull((mode) => mode.name == themeModePref) ?? ThemeMode.system;
  }

  static Future<void> setCurrentFullUser(FullUser user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    await prefs.setString(currentUserKey, userJson);
  }

  static Future<void> setRememberMe(String? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value == null) {
      await prefs.remove(rememberMeKey);
    } else {
      await prefs.setString(rememberMeKey, value);
    }
  }

  static Future<void> setThemeModePref(ThemeMode mode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(themeModeKey, mode.name);
  }
}

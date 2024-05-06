import 'package:flutter/material.dart';
import 'package:flutter_shared/services/utils/user_shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme_provider.g.dart';

@riverpod
class AppTheme extends _$AppTheme {
  AppTheme();

  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  Future<void> initThemeMode() async {
    ThemeMode value = await UserSharedPreferences.getThemeModePref();
    state = value;
  }

  void setThemeMode(ThemeMode themeMode) {
    UserSharedPreferences.setThemeModePref(themeMode);
    state = themeMode;
  }
}

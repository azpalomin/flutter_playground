import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: _lightThemeColorScheme.background,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  ),
  colorScheme: _lightThemeColorScheme,
  fontFamily: 'Robotto',
  textTheme: _lightTextTheme,
  scaffoldBackgroundColor: _lightThemeColorScheme.background,
);

const ColorScheme _lightThemeColorScheme = ColorScheme(
  background: Color(0xFFF7F5F5),
  brightness: Brightness.light,
  error: Color(0xFFB82221),
  onBackground: Colors.black,
  onError: Color(0xFFFFFFFF),
  onPrimary: Color(0xFFFAFAFA),
  onSecondary: Color(0xFFFFFFFF),
  onSurface: Color(0xFF33292C),
  onSurfaceVariant: Color(0xFF59494B),
  onTertiary: Color(0xFFFFFFFF),
  outline: Color(0xFFB3B3B3),
  outlineVariant: Color(0xFFE8E8E8),
  primary: Color.fromARGB(255, 22, 112, 70),
  secondary: Color.fromARGB(255, 15, 72, 45),
  surface: Color(0xFFF2F0F0),
  surfaceVariant: Color(0xFFE6E1E2),
  tertiary: Color.fromARGB(255, 56, 137, 99),
);

TextTheme _lightTextTheme = TextTheme(
  bodyLarge: TextStyle(
    color: _lightThemeColorScheme.onBackground,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  ),
  bodyMedium: TextStyle(
    color: _lightThemeColorScheme.onBackground,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  bodySmall: TextStyle(
    color: _lightThemeColorScheme.onBackground,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  ),
  displayLarge: TextStyle(
    color: _lightThemeColorScheme.onBackground,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  ),
  displayMedium: TextStyle(
    color: _lightThemeColorScheme.onBackground,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  ),
  displaySmall: TextStyle(
    color: _lightThemeColorScheme.onBackground,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
  headlineLarge: TextStyle(
    color: _lightThemeColorScheme.onBackground,
    fontSize: 38,
    fontWeight: FontWeight.w700,
  ),
  headlineMedium: TextStyle(
    color: _lightThemeColorScheme.onBackground,
    fontSize: 28,
    fontWeight: FontWeight.w600,
  ),
  headlineSmall: TextStyle(
    color: _lightThemeColorScheme.onBackground,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  ),
  labelLarge: TextStyle(
    color: _lightThemeColorScheme.onBackground,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  labelMedium: TextStyle(
    color: _lightThemeColorScheme.onBackground,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  ),
  labelSmall: TextStyle(
    color: _lightThemeColorScheme.onBackground,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: .3,
  ),
  titleLarge: TextStyle(
    color: _lightThemeColorScheme.onBackground,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  ),
  titleMedium: TextStyle(
    color: _lightThemeColorScheme.onBackground,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  ),
  titleSmall: TextStyle(
    color: _lightThemeColorScheme.onBackground,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  ),
);

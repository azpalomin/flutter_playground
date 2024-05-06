import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: _darkThemeColorScheme.background,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  ),
  colorScheme: _darkThemeColorScheme,
  fontFamily: 'Poppins',
  textTheme: _darkTextTheme,
  scaffoldBackgroundColor: _darkThemeColorScheme.background,
);

const ColorScheme _darkThemeColorScheme = ColorScheme(
  background: Color(0xFF515354),
  brightness: Brightness.dark,
  error: Color(0xFFB82221),
  onBackground: Color(0xFFF7F5F5),
  onError: Color(0xFFF7F5F5),
  onPrimary: Color(0xFFF7F5F5),
  onSecondary: Color(0xFFF7F5F5),
  onSurface: Color(0xFFCCCCCC),
  onSurfaceVariant: Color(0xFFB3B3B3),
  onTertiary: Color(0xFFF7F5F5),
  outline: Color(0xFF666666),
  outlineVariant: Color(0xFF383838),
  primary: Color.fromARGB(255, 22, 112, 70),
  secondary: Color.fromARGB(255, 15, 72, 45),
  surface: Color(0xFF1A1919),
  surfaceTint: Color(0xFF3D3D3D),
  surfaceVariant: Color(0xFF272727),
  tertiary: Color.fromARGB(255, 56, 137, 99),
);

TextTheme _darkTextTheme = TextTheme(
  bodyLarge: TextStyle(
    color: _darkThemeColorScheme.onBackground,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  ),
  bodyMedium: TextStyle(
    color: _darkThemeColorScheme.onBackground,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  bodySmall: TextStyle(
    color: _darkThemeColorScheme.onBackground,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  ),
  displayLarge: TextStyle(
    color: _darkThemeColorScheme.onBackground,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  ),
  displayMedium: TextStyle(
    color: _darkThemeColorScheme.onBackground,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  ),
  displaySmall: TextStyle(
    color: _darkThemeColorScheme.onBackground,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
  headlineLarge: TextStyle(
    color: _darkThemeColorScheme.onBackground,
    fontSize: 38,
    fontWeight: FontWeight.w700,
  ),
  headlineMedium: TextStyle(
    color: _darkThemeColorScheme.onBackground,
    fontSize: 28,
    fontWeight: FontWeight.w600,
  ),
  headlineSmall: TextStyle(
    color: _darkThemeColorScheme.onBackground,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  ),
  labelLarge: TextStyle(
    color: _darkThemeColorScheme.onBackground,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  labelMedium: TextStyle(
    color: _darkThemeColorScheme.onBackground,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  ),
  labelSmall: TextStyle(
    color: _darkThemeColorScheme.onBackground,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: .3,
  ),
  titleLarge: TextStyle(
    color: _darkThemeColorScheme.onBackground,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  ),
  titleMedium: TextStyle(
    color: _darkThemeColorScheme.onBackground,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  ),
  titleSmall: TextStyle(
    color: _darkThemeColorScheme.onBackground,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  ),
);

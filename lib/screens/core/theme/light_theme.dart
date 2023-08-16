import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  fontFamily: 'Ubuntu',
  primaryColor: const Color(0xFF1B1D52),
  primaryColorLight: const Color(0xFFF0F4F8),
  primaryColorDark: const Color(0xFF10324A),
  backgroundColor: const Color(0xffFCFCFC),
  secondaryHeaderColor: const Color(0xFF9BB8DA),
  disabledColor: const Color(0xFF8797AB),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  errorColor: const Color(0xFFFF6767),
  brightness: Brightness.light,
  hintColor: const Color(0xFFC0BFBF),
  focusColor: const Color(0xFFFFF9E5),
  hoverColor: const Color(0xFFF1F7FC),
  shadowColor: Colors.grey[300],
  cardColor: Colors.white,
  colorScheme: const ColorScheme.light(
      primary: Color(0xFF1B1D52),
      secondary: Color(0xFFFF9900),
      tertiary: Color(0xFFd35221)),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: const Color(0xFF090A25))),
);

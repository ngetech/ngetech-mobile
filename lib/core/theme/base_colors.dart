import 'package:flutter/material.dart';

class BaseColors {
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color warning = Color(0xFFFF0033);

  static const int _bluePrimaryValue = 0xFF3F51B5;
  static const MaterialColor blue = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      50: Color(0xFFE8EAF6),
      100: Color(0xFFC5CBE9),
      200: Color(0xFF9FA8DA),
      300: Color(0xFF7985CB),
      400: Color(0xFF5C6BC0),
      500: Color(_bluePrimaryValue),
      600: Color(0xFF394AAE),
      700: Color(0xFF3140A5),
      800: Color(0xFF29379D),
      900: Color(0xFF1B278D),
    },
  );

  static const int _charcoalPrimaryValue = 0xFF0F1112;
  static const MaterialColor charcoal = MaterialColor(
    _charcoalPrimaryValue,
    <int, Color>{
      600: Color(0xFF55565C),
      700: Color(0xFF181A1E),
      800: Color(0xFF151718),
      900: Color(_charcoalPrimaryValue),
    },
  );
}

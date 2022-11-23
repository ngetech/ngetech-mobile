import 'package:flutter/material.dart';

class BaseColors {
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  
  static const Color blue = Color(0xFF0048FF);
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF0048FF,
    <int, Color>{
      50: blue,
      100: blue,
      200: blue,
      300: blue,
      400: blue,
      500: blue,
      600: blue,
      700: blue,
      800: blue,
      900: blue,
    },
  );
  
  static const Color charcoalDarken = Color(0x000f1112);
  static const Color charcoalDark = Color(0x00151718);
  static const Color charcoal = Color(0x00181a1e);
  static const Color charcoalLight = Color(0x0055565c);
}

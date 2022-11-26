import 'package:flutter/material.dart';
import 'package:ngetech/core/theme/base_colors.dart';

class AppTheme {
  ThemeData darkTheme() => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: BaseColors.blue,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              width: 1.0,
              color: BaseColors.blue,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(
              color: BaseColors.blue,
              width: 1.2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: BaseColors.blue,
              width: 1.2,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: BaseColors.blue,
              width: 1.0,
            ),
          ),
        ),
      );
}

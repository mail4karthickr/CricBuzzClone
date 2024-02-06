import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      appBarTheme: appBarTheme,
      snackBarTheme: const SnackBarThemeData(),
      chipTheme: const ChipThemeData(
        selectedColor: Color.fromRGBO(8, 171, 126, 1),
        backgroundColor: Colors.white,
        disabledColor: Colors.blueGrey,
        labelStyle: TextStyle(color: Colors.black)
      )
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        color: Colors.green
      ),
      colorScheme: ColorScheme.fromSwatch(),
      snackBarTheme: const SnackBarThemeData(),
      chipTheme: const ChipThemeData(
        selectedColor: Colors.green,
        backgroundColor: Colors.white
      )
    );
  }

  static ColorScheme get lightColorScheme {
    return ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color.fromRGBO(8, 171, 126, 1)
    );
  }

  static AppBarTheme get appBarTheme {
    return AppBarTheme(
      color: lightColorScheme.primary
    );
  }
}
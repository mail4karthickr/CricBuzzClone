import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        color: Color.fromRGBO(8, 171, 126, 1)
      ),
      colorScheme: ColorScheme.fromSwatch(),
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
}
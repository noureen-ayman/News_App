import 'package:flutter/material.dart';
import '../AppColors/AppColors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    brightness: Brightness.dark,
  );

  static ThemeData textTheme = ThemeData(
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      bodySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ),
  );
}

import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  get themeMode => _themeMode;

  set setTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  bool get isDark => (_themeMode == ThemeMode.dark);
}

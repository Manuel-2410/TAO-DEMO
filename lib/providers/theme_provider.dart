import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  bool get darkMode => _themeMode == ThemeMode.dark;

  void toggle() {
    _themeMode = darkMode ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

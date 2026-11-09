import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    loadTheme();
  }

  ThemeMode _themeMode = ThemeMode.dark; // Dark-mode-first default

  ThemeMode get themeMode => _themeMode;

  bool get isDark => _themeMode == ThemeMode.dark;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    _saveTheme();
    notifyListeners();
  }

  Future<void> _saveTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("is_dark_theme", _themeMode == ThemeMode.dark);
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkPref = prefs.getBool("is_dark_theme");

    if (isDarkPref != null) {
      _themeMode = isDarkPref ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }
}

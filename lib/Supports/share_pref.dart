import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  SharePref._privateConstructor();

  static final SharePref instance = SharePref._privateConstructor();

  Future<void> setDarkTheme(bool theme) async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    await prefs1.setBool('theme', theme);
  }

  Future<bool?> getDarkTheme() async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    return prefs1.getBool('theme');
  }
}

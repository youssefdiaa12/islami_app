import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class provider_thene_language extends ChangeNotifier {
  ThemeMode currenttheme = ThemeMode.dark;
  String lang = 'English';
  SharedPreferences? sharedPreferences;

  void changetheme(ThemeMode theme) {
    if (currenttheme == theme) {
      return;
    } else {
      currenttheme = theme;
      notifyListeners();
    }
  }

  void changeLanguage(String lan) {
    if (lang == lan) {
      return;
    } else {
      lang = lan;
      notifyListeners();
    }
  }

  Future<void> saveTheme(ThemeMode t) async {}
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class provider_thene_language extends ChangeNotifier {
  ThemeMode currenttheme = ThemeMode.dark;
  String lang = 'English';
  SharedPreferences? preferences;

  void changetheme(ThemeMode theme) {
    if (currenttheme == theme) {
      SaveTheme(currenttheme);
      return;
    } else {
      currenttheme = theme;
      SaveTheme(currenttheme);
      notifyListeners();
    }
  }

  void changeLanguage(String lan) {
    if (lang == lan) {
      saveLanguage(lang);
      return;
    } else {
      lang = lan;
      saveLanguage(lang);
      notifyListeners();
    }
  }

  Future<void> SaveTheme(ThemeMode t) async {
    String theme1 = t == ThemeMode.dark ? 'Dark' : 'Light';
    await preferences?.setString('theme', theme1);
  }

  String? getTheme() {
    return preferences?.getString('theme');
  }

  Future<void> loadTheme() async {
    preferences = await SharedPreferences.getInstance();

    String? theme = getTheme();
    if (theme != null) {
      theme == 'Dark'
          ? currenttheme = ThemeMode.dark
          : currenttheme = ThemeMode.light;
    }
  }

  Future<void> saveLanguage(String lang) async {
    await preferences?.setString('lang', lang);
  }

  String? getLanguage() {
    return preferences?.getString('lang');
  }

  Future<void> loadLang() async {
    preferences = await SharedPreferences.getInstance();
    String? lang1 = getLanguage();

    if (lang1 != null) {
      lang1 == 'English' ? lang = 'English' : lang = 'العربيه';
    }
  }
}

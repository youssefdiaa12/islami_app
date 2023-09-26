import 'package:flutter/material.dart';

class provider_thene_language extends ChangeNotifier {
  ThemeMode currenttheme = ThemeMode.dark;
  String lang = 'English';

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
}

import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightPrimary = Color(0xFFB7935F);
  static const Color DarkPrimary = Color(0xFF141A2E);
  static const Color DarkSecondary = Color(0xFFFACC1D);
  static const bool is_Dark = true;
  static ThemeData lightTheme = ThemeData(
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
        titleMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black),
        bodyMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 30),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB7935F)),
      primaryColor: lightPrimary,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(size: 32)),
      dividerColor: const Color(0xFFB7935F),
      cardTheme: CardTheme(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))));
  static ThemeData DarkTheme = ThemeData(
      textTheme: const TextTheme(
        headlineSmall: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
        bodyMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
        bodySmall: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme.fromSeed(
        seedColor: DarkPrimary,
        primary: DarkPrimary,
        secondary: DarkPrimary,
        onPrimary: Colors.white,
        onSecondary: DarkSecondary,
        background: DarkPrimary,
      ),
      useMaterial3: true,
      primaryColor: DarkPrimary,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: DarkSecondary,
          selectedIconTheme: IconThemeData(size: 32)),
      dividerColor: DarkSecondary,
      cardTheme: CardTheme(
          color: DarkPrimary,
          surfaceTintColor: Colors.transparent,
          elevation: 18,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))));
}

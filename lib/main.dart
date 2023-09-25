import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_c9_sat/chapter_details/ChapterDetails.dart';
import 'package:islami_c9_sat/home/HomeScreen.dart';
import 'package:islami_c9_sat/home/Settings/settingsTap.dart';
import 'package:islami_c9_sat/home/Settings/settings_data.dart';
import 'package:islami_c9_sat/home/hadeth/hadeth_details.dart';
import 'package:islami_c9_sat/home/tasbeh/ayaelkorsydetails.dart';

import 'MyThemeData.dart';
import 'SplashScreen.dart';

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
  Timer(const Duration(seconds: 2), () {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  void functions() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami App',
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.DarkTheme,
      themeMode:
      settings_data.theme == 'Dark' ? ThemeMode.dark : ThemeMode.light,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(setStateFunction: functions),
        ChapterDetailsScreen.routeName: (_) => ChapterDetailsScreen(),
        hadeth_details.routeName: (_) => hadeth_details('', '', 0),
        ayaelkorsydetails.routeName: (_) => ayaelkorsydetails(''),
        settingsTap.routeName: (_) => settingsTap(),
      },
      initialRoute: HomeScreen.routeName,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('ar', ''), // Arabic
      ],
      locale: settings_data.language == 'English'
          ? const Locale('en', '')
          : const Locale('ar', ''),
    );
  }
}

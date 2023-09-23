import 'package:flutter/material.dart';
import 'package:islami_c9_sat/chapter_details/ChapterDetails.dart';
import 'package:islami_c9_sat/home/HomeScreen.dart';
import 'package:islami_c9_sat/home/hadeth/hadeth_details.dart';
import 'package:islami_c9_sat/home/tasbeh/ayaelkorsydetails.dart';

import 'MyThemeData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami App',
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.DarkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        ChapterDetailsScreen.routeName: (_) => ChapterDetailsScreen(),
        hadeth_details.routeName: (_) => hadeth_details('', '', 0),
        ayaelkorsydetails.routeName: (_) => ayaelkorsydetails(''),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

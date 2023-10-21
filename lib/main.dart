import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_c9_sat/chapter_details/ChapterDetails.dart';
import 'package:islami_c9_sat/home/HomeScreen.dart';
import 'package:islami_c9_sat/home/Settings/settingsTap.dart';
import 'package:islami_c9_sat/home/hadeth/hadeth_details.dart';
import 'package:islami_c9_sat/home/tasbeh/ayaelkorsydetails.dart';
import 'package:islami_c9_sat/provider/provider_theme_language.dart';
import 'package:provider/provider.dart';

import 'MyThemeData.dart';
import 'SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    home: SplashScreen(),
  ));
  Timer(const Duration(seconds: 2), () async {
    var provider = provider_thene_language();
    await provider.loadTheme();
    await provider.loadLang();
    runApp(ChangeNotifierProvider(
        create: (buildContext) => provider, child: const MyApp()));
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    provider_thene_language obj = Provider.of<provider_thene_language>(context);
    // Listening to the changes
    return MaterialApp(
      title: 'Islami App',
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.DarkTheme,
      themeMode: obj.currenttheme,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
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
      locale: obj.lang == 'English'
          ? const Locale('en', '')
          : const Locale('ar', ''),
    );
  }
}

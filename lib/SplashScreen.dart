import 'package:flutter/material.dart';
import 'package:islami_c9_sat/provider/provider_theme_language.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    provider_thene_language obj = Provider.of<provider_thene_language>(context);

    return Scaffold(
      body: obj.currenttheme == ThemeMode.dark
          ? Image.asset('assets/images/DARK.png',
              height: double.infinity, width: double.infinity)
          : Image.asset('assets/images/splashLight.png',
              height: double.infinity, width: double.infinity),
    );
  }
}

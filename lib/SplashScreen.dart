import 'package:flutter/material.dart';
import 'package:islami_c9_sat/provider/provider_theme_language.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    provider_thene_language obj = provider_thene_language();
    return FutureBuilder(
      future: obj.loadTheme(),
      builder: (context, snapshot) {
        return Scaffold(
          body: obj.currenttheme == ThemeMode.dark
              ? Image.asset(
                  'assets/images/DARK.png',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  'assets/images/splashLight.png',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
        );
      },
    );
  }
}

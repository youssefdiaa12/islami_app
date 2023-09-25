import 'package:flutter/material.dart';
import 'package:islami_c9_sat/home/Settings/settings_data.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: settings_data.theme == 'Dark'
          ? Image.asset('assets/images/DARK.png',
              height: double.infinity, width: double.infinity)
          : Image.asset('assets/images/splashLight.png',
              height: double.infinity, width: double.infinity),
    );
  }
}

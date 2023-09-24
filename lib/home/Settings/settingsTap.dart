import 'package:flutter/material.dart';
import 'package:islami_c9_sat/home/Settings/settings_data.dart';

import 'LanguageBottomSheet.dart';
import 'ThemeBottomSheet.dart';

class settingsTap extends StatefulWidget {
  static const String routeName = 'settings';

  @override
  State<settingsTap> createState() => _settingsTapState();
}

class _settingsTapState extends State<settingsTap> {
  void f1() {
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
              margin: const EdgeInsets.only(left: 12),
              child: const Text('Theme')),
          InkWell(
            onTap: () {
              setState(() {
                ShowThemeBottomSheet();
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12, left: 12),
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.background,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onSecondary,
                  )),
              child: Text(settings_data.theme,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(margin: EdgeInsets.only(left: 12), child: Text('Language')),
          InkWell(
            onTap: () {
              setState(() {
                ShowLanguageBottomSheet();
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 12, left: 12),
              padding: EdgeInsets.all(12),
              child: Text(settings_data.language,
                  style: Theme.of(context).textTheme.bodyMedium),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.background,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onSecondary,
                  )),
            ),
          )
        ],
      ),
    );
  }

  void ShowThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ThemeBottomSheet(setStateFunction: f1);
      },
    );
  }

  void ShowLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LanguageBottomSheet(setStateFunction: f1);
      },
    );
  }
}

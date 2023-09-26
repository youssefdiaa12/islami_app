import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider_theme_language.dart';
import 'LanguageBottomSheet.dart';
import 'ThemeBottomSheet.dart';

class settingsTap extends StatefulWidget {
  static const String routeName = 'settings';

  @override
  State<settingsTap> createState() => _settingsTapState();
}

class _settingsTapState extends State<settingsTap> {


  @override
  Widget build(BuildContext context) {
    provider_thene_language obj = Provider.of<provider_thene_language>(context);

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
              ShowThemeBottomSheet();
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
              child: Text(
                  obj.currenttheme == ThemeMode.light ? 'Light' : 'Dark',
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.only(left: 12),
              child: const Text('Language')),
          InkWell(
            onTap: () {
              ShowLanguageBottomSheet();
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
              child:
                  Text(obj.lang, style: Theme.of(context).textTheme.bodyMedium),
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
        return ThemeBottomSheet();
      },
    );
  }

  void ShowLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }
}

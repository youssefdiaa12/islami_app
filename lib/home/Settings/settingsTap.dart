import 'package:flutter/material.dart';

import 'LanguageBottomSheet.dart';
import 'ThemeBottomSheet.dart';

class settingsTap extends StatefulWidget {
  const settingsTap({Key? key}) : super(key: key);

  @override
  State<settingsTap> createState() => _settingsTapState();
}

class _settingsTapState extends State<settingsTap> {
  void f1() {
    setState(() {
      theme_mode;
    });
  }

  String theme_mode = 'Light';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Container(margin: EdgeInsets.only(left: 12), child: Text('Theme')),
          InkWell(
            onTap: () {
              setState(() {
                ShowThemeBottomSheet();
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 12, left: 12),
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.background,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onSecondary,
                  )),
              child: Text(theme_mode,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(margin: EdgeInsets.only(left: 12), child: Text('Language')),
          InkWell(
            onTap: () {
              ShowLanguageBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.only(right: 12, left: 12),
              padding: EdgeInsets.all(12),
              child: Text('Engilsh',
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
    setState(() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return ThemeBottomSheet(theme_mode, setStateFunction: f1);
        },
      );
    });
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

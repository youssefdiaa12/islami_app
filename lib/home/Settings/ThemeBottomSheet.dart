import 'package:flutter/material.dart';
import 'package:islami_c9_sat/MyThemeData.dart';
import 'package:islami_c9_sat/home/Settings/settings_data.dart';

class ThemeBottomSheet extends StatefulWidget {
  void Function() setStateFunction;

  ThemeBottomSheet({super.key, required this.setStateFunction});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  bool is_selected = false;
  String s1 = settings_data.theme;
  String s2 = settings_data.theme == 'Light' ? 'Dark' : 'Light';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(onTap: () {}, child: selectedButton(settings_data.theme)),
          const SizedBox(height: 5),
          InkWell(
              onTap: () {
                if (s2 == 'Light') {
                  is_selected = false;
                } else {
                  is_selected = true;
                }
                selected();
              },
              child: unselectedButton(s2)),
        ],
      ),
    );
  }

  Widget selectedButton(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
        ),
        Icon(Icons.check, color: Theme.of(context).colorScheme.onSecondary),
      ],
    );
  }

  Widget unselectedButton(String text) {
    return Text(text, style: Theme.of(context).textTheme.bodyMedium);
  }

  void selected() {
    setState(() {
      is_selected
          ? {s1 = 'Dark', s2 = 'Light'}
          : {
              s1 = 'Light',
              s2 = 'Dark',
            };
      settings_data.theme = s1;
      s1 == 'Dark' ? MyThemeData.is_Dark = true : MyThemeData.is_Dark = false;
    });
    widget.setStateFunction();
  }
}

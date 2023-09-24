import 'package:flutter/material.dart';
import 'package:islami_c9_sat/home/Settings/settings_data.dart';

class LanguageBottomSheet extends StatefulWidget {
  void Function() setStateFunction;

  LanguageBottomSheet({super.key, required this.setStateFunction});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheet();
}

class _LanguageBottomSheet extends State<LanguageBottomSheet> {
  bool is_selected = false;
  String s1 = settings_data.language;
  String s2 = settings_data.language == 'English' ? 'العربيه' : 'English';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(onTap: () {}, child: selectedButton(s1)),
          const SizedBox(height: 5),
          InkWell(
              onTap: () {
                if (s2 == 'English') {
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
          ? {s1 = 'العربيه', s2 = 'English'}
          : {
              s1 = 'English',
              s2 = 'العربيه',
            };
      settings_data.language = s1;
    });
    widget.setStateFunction();
  }
}

import 'package:flutter/material.dart';

class ThemeBottomSheet extends StatefulWidget {
  String name = '';
  void Function() setStateFunction;

  ThemeBottomSheet(this.name, {super.key, required this.setStateFunction});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  bool is_selected = false;
  String s1 = "Light";
  String s2 = "Dark";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                selected();
                widget.name = s1;
                widget.setStateFunction();
              },
              child: selectedButton(s1)),
          const SizedBox(height: 5),
          InkWell(
              onTap: () {
                if (s2 == 'Light') {
                  is_selected = false;
                } else {
                  is_selected = true;
                }
                selected();
                widget.name = s1;
                widget.setStateFunction();
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
              widget.name = s1,
            };
    });
    widget.setStateFunction;
  }
}

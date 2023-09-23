import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  bool is_selected = false;
  String s1 = "English";
  String s2 = "العربيه";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                selected();
              },
              child: selectedButton(s1)),
          const SizedBox(height: 5),
          InkWell(
              onTap: () {
                if (s2 == "English") {
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
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 24),
        ),
        Icon(Icons.check, color: Theme.of(context).primaryColor),
      ],
    );
  }

  Widget unselectedButton(String text) {
    return Text(text, style: const TextStyle(fontSize: 24));
  }

  void selected() {
    setState(() {
      is_selected
          ? {s1 = 'العربيه', s2 = 'English'}
          : {s1 = 'English', s2 = 'العربيه'};
    });
  }
}

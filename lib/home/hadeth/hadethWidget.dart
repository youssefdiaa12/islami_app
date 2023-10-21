import 'package:flutter/material.dart';

class hadethWidget extends StatelessWidget {
  String content;
  int index;

  hadethWidget(this.content, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        '$content',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: const TextStyle(
          fontSize: 20,
          fontFamily: "DTHUtils",
        ),
      ),
    );
  }
}

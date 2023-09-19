import 'package:flutter/material.dart';
import 'package:islami_c9_sat/home/hadeth/hadeth_details.dart';

class HadethNameWidget extends StatelessWidget {
  String name;
  String content;
  int index;

  HadethNameWidget(this.name, this.content, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(hadeth_details.routeName,
            arguments: hadeth_details(name, content, index));
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

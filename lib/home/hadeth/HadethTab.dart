import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:islami_c9_sat/home/hadeth/HadethNameWidget.dart';
import 'package:islami_c9_sat/home/hadeth/hadeth_data.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  @override
  Widget build(BuildContext context) {
    if (verses.isEmpty) loadfile();
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset('assets/images/hadeth_logo.png'),
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(
                      color: Theme.of(context).dividerColor, width: 2))),
          child: Text(AppLocalizations.of(context)!.hadeth,
              style: TextStyle(fontSize: 22)),
        ),
        verses.isEmpty
            ? const Expanded(
                flex: 3, child: Center(child: CircularProgressIndicator()))
            : Expanded(
                flex: 3,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return HadethNameWidget(ahdethNames[index].title,
                          ahdethNames[index].content, index);
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 2,
                        width: double.infinity,
                        color: Theme.of(context).dividerColor,
                        margin: const EdgeInsets.symmetric(horizontal: 64),
                      );
                    },
                    itemCount: ahdethNames.length),
              ),
      ],
    );
  }

  String title = '';
  String content1 = '';
  List<String> verses = [];
  List<hadeth_data> ahdethNames = [];
  int cnt2 = 0;
  List<String> contents = [];

  void loadfile() async {
    String filecontent =
        await rootBundle.loadString("assets/ahadeth/ahadeth.txt");
    verses = filecontent.split("\n");
    int cnt = 0;
    for (int i = 0; i < verses.length; i++) {
      if (verses[i].contains("#")) {
        for (int j = cnt + 1; j < i; j++) {
          content1 += verses[j].toString();
          content1 += '\n';
        }
        title = verses[cnt].toString();
        cnt = i + 1;
        hadeth_data obj = hadeth_data(title, content1, cnt2);
        content1 = '';
        cnt2++;
        ahdethNames.add(obj);
        title = '';
      }
    }

    setState(() {});
  }
}

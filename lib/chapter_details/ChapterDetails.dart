import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c9_sat/chapter_details/VerseWidget.dart';
import 'package:provider/provider.dart';

import '../provider/provider_theme_language.dart';

class ChapterDetailsScreen extends StatefulWidget {
  static const String routeName = 'chapter_details';

  @override
  State<ChapterDetailsScreen> createState() => _ChapterDetailsScreenState();
}

class _ChapterDetailsScreenState extends State<ChapterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    provider_thene_language obj = Provider.of<provider_thene_language>(context);

    var args = ModalRoute.of(context)?.settings.arguments as ChapterDetailsArgs;
    if (verses.isEmpty) loadFile(args.index);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  obj.currenttheme == ThemeMode.dark
                      ? 'assets/images/dark_bg.png'
                      : 'assets/images/main_background.jpg',
                ),
                fit: BoxFit.fill)),
        child: Scaffold(
            appBar: AppBar(
              title: Text(args.name),
            ),
            body: verses.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
              height: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 18),
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return VerseWidget(verses[index], index);
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            height: 2,
                            width: double.infinity,
                            color: Theme.of(context).dividerColor,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 64, vertical: 8),
                          );
                        },
                        itemCount: verses.length,
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  List<String> verses = [];

  void loadFile(int index) async {
    String fileContent =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    verses = fileContent.split("\n");
    print(fileContent);
    setState(() {});
  }
}

class ChapterDetailsArgs {
  String name;
  int index;

  ChapterDetailsArgs(this.name, this.index);
}

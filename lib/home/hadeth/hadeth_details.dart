import 'package:flutter/material.dart';
import 'package:islami_c9_sat/home/hadeth/hadethWidget.dart';
import 'package:provider/provider.dart';

import '../../provider/provider_theme_language.dart';

class hadeth_details extends StatelessWidget {
  static const String routeName = 'hadeth_details';
  String title;
  String content;
  int index;

  hadeth_details(this.title, this.content, this.index);

  @override
  Widget build(BuildContext context) {
    provider_thene_language obj = Provider.of<provider_thene_language>(context);

    var args = ModalRoute.of(context)?.settings.arguments as hadeth_details;
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
              title: Text(args.title),
            ),
            body: Container(
              height: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 18,
                      margin:
                      EdgeInsets.symmetric(vertical: 24, horizontal: 18),
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return hadethWidget(args.content, index);
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
                        itemCount: 1,
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

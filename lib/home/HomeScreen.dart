import 'package:flutter/material.dart';
import 'package:islami_c9_sat/MyThemeData.dart';
import 'package:islami_c9_sat/home/Settings/settingsTap.dart';
import 'package:islami_c9_sat/home/hadeth/HadethTab.dart';
import 'package:islami_c9_sat/home/quran/QuranTab.dart';
import 'package:islami_c9_sat/home/radio/RadioTab.dart';
import 'package:islami_c9_sat/home/tasbeh/TasbehTab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                MyThemeData.is_Dark
                    ? 'assets/images/dark_bg.png'
                    : 'assets/images/main_background.jpg',
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Islami'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedTabIndex = index;
            });
          },
          currentIndex: selectedTabIndex,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/ic_quran.png')),
                label: "Quran"),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/ic_hadeth.png')),
                label: "Hadeth"),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/ic_sebha.png')),
                label: "Tasbeh"),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/ic_radio.png')),
                label: "Radio"),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: (Icon(Icons.settings)),
                label: "Settings")
          ],
        ),
        body: tabs[selectedTabIndex],
      ),
    );
  }

  var tabs = [QuranTab(), HadethTab(), TasbehTab(), RadioTab(), settingsTap()];
}

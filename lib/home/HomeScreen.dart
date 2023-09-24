import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:islami_c9_sat/home/Settings/settingsTap.dart';
import 'package:islami_c9_sat/home/Settings/settings_data.dart';
import 'package:islami_c9_sat/home/hadeth/HadethTab.dart';
import 'package:islami_c9_sat/home/quran/QuranTab.dart';
import 'package:islami_c9_sat/home/radio/RadioTab.dart';
import 'package:islami_c9_sat/home/tasbeh/TasbehTab.dart';

class HomeScreen extends StatefulWidget {
  void Function() setStateFunction;

  HomeScreen({required this.setStateFunction});

  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void function() {
    setState(() {});
  }

  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(settings_data.theme == 'Dark'
                  ? 'assets/images/dark_bg.png'
                  : 'assets/images/main_background.jpg'),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.app_name),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedTabIndex = index;
            });
            widget.setStateFunction();
          },
          currentIndex: selectedTabIndex,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/ic_quran.png')),
                label: AppLocalizations.of(context)!.quran),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/ic_hadeth.png')),
                label: AppLocalizations.of(context)!.hadeth),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/ic_sebha.png')),
                label: AppLocalizations.of(context)!.tasbeh),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/ic_radio.png')),
                label: AppLocalizations.of(context)!.radio),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: (Icon(Icons.settings)),
                label: AppLocalizations.of(context)!.settings)
          ],
        ),
        body: tabs[selectedTabIndex],
      ),
    );
  }

  var tabs = [QuranTab(), HadethTab(), TasbehTab(), RadioTab(), settingsTap()];
}

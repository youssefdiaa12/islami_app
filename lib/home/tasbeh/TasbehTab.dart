import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:islami_c9_sat/home/tasbeh/ayaelkorsydetails.dart';

class TasbehTab extends StatefulWidget {
  TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int cnt = 0;
  double _rotation = 0;

  void _onPressed() {
    setState(() {
      _rotation = _rotation + (-(pi / 4));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (verses.isEmpty) loadfile();
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Container(
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(left: 30),
                        child: const Image(
                            height: 70,
                            alignment: Alignment.centerRight,
                            fit: BoxFit.fill,
                            image: AssetImage(
                                'assets/images/head_sebha_logo.png')),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 330,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: _onPressed,
                          child: Transform.rotate(
                            angle: _rotation,
                            child: const Image(
                                alignment: Alignment.bottomRight,
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    'assets/images/body_sebha_logo.png')),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(AppLocalizations.of(context)!.tasbeh,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Container(
              height: 80,
              width: 80,
              padding: EdgeInsets.only(top: 8),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.white;
                      }
                      return const Color(0xffCAB497);
                    },
                  ),
                ),
                onPressed: () {
                  _onPressed();

                  setState(() {
                    if (cnt == 99) {
                      cnt = 0;
                    }
                    cnt++;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    '$cnt',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            cnt == 99
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xffB7935F),
                          ),
                          child: Center(child: function(cnt)),
                        ),
                      ),
                      verses.isEmpty
                          ? const Center(child: CircularProgressIndicator())
                          : Padding(
                              padding: EdgeInsets.only(top: 16.0),
                              child: Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xffB7935F),
                                ),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              30.0), // Set the border radius to make it circular
                                        ),
                                      ),
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                        return const Color(0xffB7935F);
                                      }),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        Navigator.of(context).pushNamed(
                                            ayaelkorsydetails.routeName,
                                            arguments:
                                                ayaelkorsydetails(verses));
                                      });
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!.aya_elkorst,
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                            ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xffB7935F),
                      ),
                      child: Center(child: function(cnt)),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Text function(int cnt) {
    if (cnt % 66 == 0 && cnt != 0) {
      return Text(AppLocalizations.of(context)!.all_akbar,
          style: TextStyle(color: Colors.white, fontSize: 30));
    } else if (cnt % 33 == 0 && cnt != 99 && cnt != 0) {
      return Text(AppLocalizations.of(context)!.elh,
          style: TextStyle(color: Colors.white, fontSize: 30));
    }
    return Text(AppLocalizations.of(context)!.sobhan_allah,
        style: TextStyle(color: Colors.white, fontSize: 30));
  }

  String verses = '';

  void loadfile() async {
    String filecontent = await rootBundle.loadString("assets/ayaKorsy.txt");
    verses = filecontent;
    setState(() {
      verses;
    });
  }
}

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:islami_c9_sat/MyThemeData.dart';
import 'package:islami_c9_sat/api/apiManger.dart';
import 'package:islami_c9_sat/provider/provider_theme_language.dart';
import 'package:provider/provider.dart';

import '../../quranApi/QuranList.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
  int idx = 0;
  bool is_play = false;
}

class _RadioTabState extends State<RadioTab> {
  @override
  void dispose() {
    // Stop the audio player by setting is_play to false
    widget.is_play = false;
    playRadio('', widget.is_play);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    provider_thene_language provider =
        Provider.of<provider_thene_language>(context);

    return Scaffold(
        body: Center(
      child: FutureBuilder(
          future: apiManager.getSources(provider.lang),
          builder: (context, AsyncSnapshot<QuranList> snapshot) {
            if (snapshot.hasData) {
              return Center(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: const Image(
                                    image:
                                        AssetImage('assets/images/kaset.png')),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 32.0),
                                  child: Text(
                                      AppLocalizations.of(context)!.radio,
                                      style: TextStyle(
                                          color: provider.currenttheme ==
                                                  ThemeMode.dark
                                              ? MyThemeData.DarkSecondary
                                              : MyThemeData.lightPrimary,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600))),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                      textDirection: TextDirection.ltr,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 32.0),
                                            child: InkWell(
                                                onTap: () {
                                                  if (widget.idx == 1) {
                                                    setState(() {
                                                      widget.idx--;
                                                      playRadio(
                                                          snapshot
                                                                  .data
                                                                  ?.livetv?[
                                                                      widget
                                                                          .idx]
                                                                  .url ??
                                                              '',
                                                          widget.is_play);
                                                    });
                                                  } else {
                                                    setState(() {
                                                      widget.idx++;
                                                      playRadio(
                                                          snapshot
                                                                  .data
                                                                  ?.livetv?[
                                                                      widget
                                                                          .idx]
                                                                  .url ??
                                                              '',
                                                          widget.is_play);
                                                    });
                                                  }
                                                  print(widget.idx);
                                                },
                                                child: Image(
                                                    image: AssetImage(provider
                                                                .currenttheme ==
                                                            ThemeMode.dark
                                                        ? 'assets/images/Icon metro-next _dark.png'
                                                        : 'assets/images/Icon metro-next left.png')))),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (widget.is_play) {
                                                  widget.is_play = false;
                                                } else {
                                                  widget.is_play = true;
                                                }
                                                playRadio(
                                                    snapshot
                                                            .data
                                                            ?.livetv?[
                                                                widget.idx]
                                                            .url ??
                                                        '',
                                                    widget.is_play);
                                              });
                                            },
                                            child: widget.is_play
                                                ? Icon(
                                                    Icons.pause,
                                                    color:
                                                        provider.currenttheme ==
                                                                ThemeMode.dark
                                                            ? MyThemeData
                                                                .DarkSecondary
                                                            : MyThemeData
                                                                .lightPrimary,
                                                    size: 36,
                                                  )
                                                : Image(
                                                    image: AssetImage(provider
                                                                .currenttheme ==
                                                            ThemeMode.dark
                                                        ? 'assets/images/Icon awesome-play_dark.png'
                                                        : 'assets/images/Icon awesome-play.png'))),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 32.0),
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (widget.idx == 0) {
                                                      widget.idx++;
                                                      playRadio(
                                                          snapshot
                                                                  .data
                                                                  ?.livetv?[
                                                                      widget
                                                                          .idx]
                                                                  .url ??
                                                              '',
                                                          widget.is_play);
                                                    } else {
                                                      widget.idx = 0;
                                                      playRadio(
                                                          snapshot
                                                                  .data
                                                                  ?.livetv?[
                                                                      widget
                                                                          .idx]
                                                                  .url ??
                                                              '',
                                                          widget.is_play);
                                                    }
                                                  });
                                                  print(widget.idx);
                                                },
                                                child: Image(
                                                    image: AssetImage(provider
                                                                .currenttheme ==
                                                            ThemeMode.dark
                                                        ? 'assets/images/Icon metro-next_dark.png'
                                                        : 'assets/images/Icon metro-next.png')))),
                                      ]))
                            ]),
                      )));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    ));
  }

  AudioPlayer audioPlayer = AudioPlayer();

  void playRadio(String url, bool isplay) {
    print(url);
    try {
      if (isplay) {
        audioPlayer.setVolume(1.0);
        audioPlayer.play(UrlSource(url));
      } else {
        audioPlayer.pause();
      }
    } catch (e) {
      // Handle the exception here
      Center(child: CircularProgressIndicator());
      // Display an error message or perform any necessary cleanup actions
    }
  }
}

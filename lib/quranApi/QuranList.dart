import 'Livetv.dart';

/// livetv : [{"id":3,"name":"قناة القرآن الكريم","url":"https://win.holol.com/live/quran/playlist.m3u8"},{"id":4,"name":"قناة السنة النبوية","url":"https://win.holol.com/live/sunnah/playlist.m3u8"}]

class QuranList {
  QuranList({
    this.livetv,
  });

  QuranList.fromJson(dynamic json) {
    if (json['livetv'] != null) {
      livetv = [];
      json['livetv'].forEach((v) {
        livetv?.add(Livetv.fromJson(v));
      });
    }
  }

  List<Livetv>? livetv;

  QuranList copyWith({
    List<Livetv>? livetv,
  }) =>
      QuranList(
        livetv: livetv ?? this.livetv,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (livetv != null) {
      map['livetv'] = livetv?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

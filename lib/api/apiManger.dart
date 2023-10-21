import 'dart:convert';

import 'package:http/http.dart' as http;

import '../quranApi/QuranList.dart';

class apiManager {
  static Future<QuranList> getSources(String lang) async {
    var uri = Uri.https('mp3quran.net', 'api/v3/live-tv', {'language': lang});
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      return QuranList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Quran List');
    }
  }
}

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_url_shortener/models/url_model.dart';
import 'package:http/http.dart' as http;

final urlProvider = ChangeNotifierProvider(
  (ref) => UrlShortState(),
);

final buttonProvider = StateNotifierProvider((ref) => ButonColor(true));

class ButonColor extends StateNotifier<bool> {
  ButonColor(bool state) : super(true);

  butonaTiklandi() {
    state == false ? true : false;
  }
}

class UrlShortState extends ChangeNotifier {
  final urlController = TextEditingController();
  String shortUrlMessage = "";

  List kisaltilacakUrl = [];
  List kisaltilmisUrl = [];
  handleGetLinkButton() async {
    final longUrl = urlController.text;
    final String shortUrl = await getShortLink(longUrl);
    shortUrlMessage = shortUrl;
    kisaltilmisUrl.add(shortUrl);
    kisaltilacakUrl.add(longUrl);
    print(kisaltilmisUrl.length);
    notifyListeners();
  }

  deleteHistoryUrl(int index) {
    kisaltilmisUrl.removeAt(index);
    notifyListeners();
  }

  Future getShortLink(String longUrl) async {
    var url = Uri.parse("https://api.shrtco.de/v2/shorten?url=$longUrl");

    //var response = await http.post(Uri.parse("https://api.shrtco.de/v2/shorten?url="), body: url);
    var response = await http.get(url);

    var jsonUrl = UrlModel.fromJson(jsonDecode(response.body));

    if (response.statusCode == 201) {
      debugPrint("Bağlantı Başarılı");
    } else {
      debugPrint("Bağlantı Başarısız Hata Kodu : ${response.statusCode}");
    }

    return jsonUrl.result!.fullShortLink2;
  }
}

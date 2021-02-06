import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hackathonapp/model/deprem.dart';
import 'package:hackathonapp/service/deprem_service.dart';
import 'package:http/http.dart' as http;

class Depremler with ChangeNotifier {
  Deprem _deprem;
  DepremService _depremService = DepremService();
  get deprem => _deprem;
  set deprem(Deprem deprem) {
    _deprem = deprem;
    notifyListeners();
  }

  Stream<Deprem> depremler() {
    deprem(
      _depremService.getDepremler(Duration(seconds: 1)),
    );
  }

  Future<Deprem> getDeprem() async {
    http.Response res = await http
        .get("https://api.orhanaydogdu.com.tr/deprem/live.php?limit=5");

    return Deprem.fromJson(json.decode(res.body));
  }

  Stream<Deprem> getDepremler(Duration refreshTime) async* {
    while (true) {
      await Future.delayed(refreshTime);
      yield await getDeprem();
    }
  }
}

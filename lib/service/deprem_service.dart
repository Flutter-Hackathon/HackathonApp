import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hackathonapp/model/deprem.dart';

class DepremService {
  Future<Deprem> getDeprem() async {
    http.Response res = await http
        .get("https://api.orhanaydogdu.com.tr/deprem/live.php?limit=10");

    return Deprem.fromJson(json.decode(res.body));
  }

  Stream<Deprem> getDepremler(Duration refreshTime) async* {
    while (true) {
      await Future.delayed(refreshTime);
      yield await getDeprem();
    }
  }
}

import 'package:flutter/widgets.dart';
import 'package:hackathonapp/model/deprem.dart';
import 'package:hackathonapp/service/deprem_service.dart';

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
}

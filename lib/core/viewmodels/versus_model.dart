import 'package:decidable/core/models/verse.dart';
import 'package:decidable/core/services/api.dart';
import 'package:decidable/core/viewmodels/base_model.dart';
import 'package:meta/meta.dart';

class VersusModel extends BaseModel {
  Api _api;

  VersusModel({@required Api api}) : _api = api;

  List<Verse> versus;

  Future getVersus(int userId) async {
    setBusy(true);
    versus = await _api.getVersusForUser(userId);
    setBusy(false);
  }
}

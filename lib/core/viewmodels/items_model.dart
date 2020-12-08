import 'package:decidable/core/viewmodels/base_model.dart';


class ItemsModel extends BaseModel {
  
  //ItemsModel({@required Api api}) : _api = api;

  List<int> values;

  void increment(int value){
    values.add(value);
  }
  
}

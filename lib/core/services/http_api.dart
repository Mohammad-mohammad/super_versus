import 'package:decidable/core/models/verse.dart';
import 'package:decidable/core/services/api.dart';

class HttpApi implements Api{
  @override
  Future<List<Verse>> getVersusForUser(int userId) async{
    await Future.delayed(Duration(seconds: 2));
    throw UnimplementedError();
  }

  
}
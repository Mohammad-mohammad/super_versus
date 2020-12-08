import 'package:decidable/core/models/verse.dart';

abstract class Api{
  
    Future<List<Verse>> getVersusForUser(int userId);

    
}
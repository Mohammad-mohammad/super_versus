import 'package:decidable/core/models/verse.dart';
import 'package:decidable/core/services/api.dart';


class FakeApi implements Api{
  
  @override
  Future<List<Verse>> getVersusForUser(int userId) async{
    await Future.delayed(Duration(seconds: 2));        
    Verse v1 = Verse(
        id: "1",
        title: "itemx ",
        date: DateTime.now(),
        isFavorite: true,
        isPrivate: true,
        userName: "by you",
        imageUrls: [
          "https://www.woolha.com/media/2020/03/eevee.png",
          "https://www.woolha.com/media/2020/03/eevee.png",
          "https://www.woolha.com/media/2020/03/eevee.png",
          "https://www.woolha.com/media/2020/03/eevee.png"
        ]);
    Verse v2 = Verse(
        id: "2",
        title: "itemx itemx itemx itemx itemx itemx itemx itemx itemx itemx itemx itemx ",
        date: DateTime.now(),
        isFavorite: false,
        isPrivate: false,
        userName: "by someone",
        imageUrls: [
          "https://www.woolha.com/media/2020/03/eevee.png",
          "https://www.woolha.com/media/2020/03/eevee.png",
        ]);    
    List<Verse> list=[v1,v2];
    return list;
  }

  
}
import 'package:decidable/core/models/product.dart';

class Services {
  
  static Future<List<Product>> search(String query) async {
    //await Future.delayed(Duration(seconds: 2));   
    List<Product> list=[];
    if(query.isEmpty){
      return list;
    }
    Product p1= Product(name: "Samsung Galaxy M31 Prime", id: "1");
    Product p2= Product(name: "Samsung Galaxy S20 Ultra 5G", id: "2");
    Product p3= Product(name: "Samsung Galaxy F41", id: "3");
    Product p4= Product(name: "Apple iPhone 12 Pro Max", id: "4");
    Product p5= Product(name: "Apple iPhone 11 Pro Max", id: "5");
    list= [p1,p2,p3,p4,p5];    
    return list.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();    
  }
}
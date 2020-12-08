import 'package:flutter/cupertino.dart';

class Vs{
  static int currentItemIndex=0;
  static int currentAttrIndex=1;
  static int _currentItemIndexInternal=0;
  static int _currentAttrIndexInternal=0;
  static int itemsNumber=2;
  static bool ignoreImportance = false;
  static bool isPublic = true;
  static bool havePhoto = true;  
  static List<Item> _items= new List<Item>();   

  static void addItem(String itemName){
    Item item= new Item(name: itemName);
    _items.add(item);
    currentItemIndex++;
    _currentItemIndexInternal= _items.length-1;
  }  

  static void addAttribute(Attribute attribute){
    Item currentItem = _items.elementAt(_currentItemIndexInternal);    
    currentItem.attributes.add(attribute);
    currentAttrIndex++; 
    _currentAttrIndexInternal++; //= currentItem.attributes.length-1;
  }

  static String getCurrentItemName(){
    Item item = _items.elementAt(_currentItemIndexInternal);
    if(item == null) {
      return "Error";
    }else{
      return _items.elementAt(_currentItemIndexInternal).name;
    }    
  }

  static String getCurrentAttributeName(){
    Item item = _items.elementAt(0);
    if(item == null) {
      return "Error";
    }else{
      return item.attributes.elementAt(_currentAttrIndexInternal).name;
    }
  }

  static String getTextualItemNumber(){
    String result = "item #"+(currentItemIndex+1).toString();
    return result;
  }

  static bool isFinish(){
    if(currentItemIndex==itemsNumber){
      return true;    
    }else{
      return false;
    }
  }
  static List<Attribute> getPrevAttributesFromPrevItems(){
    List<Attribute> result= new List<Attribute>();
    for(int i =0; i<_currentItemIndexInternal; i++){
      Item item= _items.elementAt(i);
      Attribute attr= item.attributes.elementAt(_currentAttrIndexInternal);
      result.add(attr);
    }
    return result;   
  }

  static void resetForNewItem() {    
    currentAttrIndex=1;
    _currentAttrIndexInternal=0;
  }

  static void reset(){
    currentItemIndex=0;
    currentAttrIndex=1;
    _currentItemIndexInternal=0;
    _currentAttrIndexInternal=0;
    itemsNumber=2;
    ignoreImportance = false;
    isPublic = true;
    havePhoto = true;  
    _items.clear();
  }

  static String toStringx(){
    String result="";
    result+= "currentItemIndex: "+ currentItemIndex.toString()+"\n";
    result+= "currentAttrIndex: "+ currentAttrIndex.toString()+"\n";
    result+= "_currentItemIndexInternal: "+ _currentItemIndexInternal.toString()+"\n";
    result+= "_currentAttrIndexInternal: "+ _currentAttrIndexInternal.toString()+"\n";
    result+= "itemsNumber: "+ itemsNumber.toString()+"\n";

    return result;
  }
}

class Item{
  String name;
  String photoUrl;
  List<Attribute> attributes= new List<Attribute>();
  
  Item({@required this.name, this.photoUrl});  
}
  

class Attribute {
  String name;
  String value;
  int importance;

  Attribute({@required this.name, @required this.value, @required this.importance});

}
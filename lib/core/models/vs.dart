import 'package:flutter/cupertino.dart';

class Vs {
  static int currentItemIndex = 0;
  static int currentAttrIndex = 0;
  static int itemsNumber = 2;
  static int templateId = 0;
  static bool ignoreImportance = false;
  static bool isPublic = true;
  static bool havePhoto = true;
  static List<Item> _items = new List<Item>();
  static bool _isFirstItem = true;
  static bool _isFirstAttr = true;

  static void reset() {
    currentItemIndex = 0;
    currentAttrIndex = 0;
    itemsNumber = 2;
    ignoreImportance = false;
    isPublic = true;
    havePhoto = true;
    _isFirstItem = true;
    _isFirstAttr = true;
    _items.clear();
  }

  static int lastItemIndex() {
    return _items.length == 0 ? 0 : _items.length - 1;
  }

  static void addItem(String itemName) {
    Item item = new Item(name: itemName);
    _items.add(item);
    if (_isFirstItem) {
      _isFirstItem = false;
    } else {
      currentItemIndex++;
    }
  }

  static void nextAttribute() {
    currentAttrIndex++;
  }

  static void preAttribute() {
    if (currentAttrIndex > 0) currentAttrIndex--;
  }

  static void addAttribute(Attribute attribute) {
    Item currentItem = _items.elementAt(currentItemIndex);
    if (currentAttrIndex >= currentItem.attributes.length) {
      currentItem.attributes.add(attribute);
    } else {
      currentItem.attributes.removeAt(currentAttrIndex);
      currentItem.attributes.insert(currentAttrIndex, attribute);
    }
  }

  static String getCurrentItemName() {
    Item item = _items.elementAt(currentItemIndex);
    if (item == null) {
      return "Error";
    } else {
      return _items.elementAt(currentItemIndex).name;
    }
  }

  static Attribute getCurrentAttribute() {
    Attribute result;
    Item item = _items.elementAt(currentItemIndex);
    if (item != null) {
      if (currentAttrIndex < item.attributes.length) {
        result = item.attributes.elementAt(currentAttrIndex);
      }
    }
    return result;
  }

  static bool attributesLengthLimit() {
    bool result = false;
    if (currentItemIndex != 0) {
      if (currentAttrIndex + 1 == _items.elementAt(0).attributes.length) {
        result = true;
      }
    }
    return result;
  }

  static String getCurrentAttributeName() {
    print(currentAttrIndex);
    Item item = _items.elementAt(0);
    if (item == null) {
      return "Error";
    } else {
      return item.attributes.elementAt(currentAttrIndex).name;
    }
  }

  static String getTextualItemNumber() {
    String result = "item #" + (_items.length + 1).toString();
    return result;
  }

  static bool isFinish() {
    if (currentItemIndex + 1 == itemsNumber) {
      return true;
    } else {
      return false;
    }
  }

  static List<Attribute> getPrevAttributesFromPrevItems() {
    List<Attribute> result = new List<Attribute>();
    for (int i = 0; i < currentItemIndex; i++) {
      Item item = _items.elementAt(i);
      Attribute attr = item.attributes.elementAt(currentAttrIndex);
      result.add(attr);
    }
    return result;
  }

  static bool validateNextItem() {
    bool result = true;
    if (currentItemIndex != 0) {
      Item item = _items.elementAt(0);
      if (item.attributes.length > currentAttrIndex + 1) {
        result = false;
      } else {
        result = true;
      }
    }
    return result;
  }

  static void resetForNewItem() {
    currentAttrIndex = 0;
    _isFirstAttr = true;
  }

  static List<Attribute> getAllAttributes() {
    List<Attribute> result = new List();
    if (_items.isNotEmpty) {
      Item item = _items.first;
      result= item.attributes;
    }
    return result;
  }

  static String toStringx() {
    String result = "";
    result += "currentItemIndex: " + currentItemIndex.toString() + "\n";
    result += "currentAttrIndex: " + currentAttrIndex.toString() + "\n";
    result += "itemsNumber: " + itemsNumber.toString() + "\n";

    return result;
  }
}

class Item {
  String name;
  String photoUrl;
  List<Attribute> attributes = new List<Attribute>();

  Item({@required this.name, this.photoUrl});
}

class Attribute {
  String name;
  String value;
  int valueImportance;
  double attrImportance= 10.0;

  Attribute(
      {@required this.name,
      @required this.value,
      @required this.valueImportance});

  int getAttrImportance(){
    return (attrImportance / 10).round();
  }
}

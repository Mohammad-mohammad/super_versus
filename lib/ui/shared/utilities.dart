
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utilities{  

  static String getOrdinalNumber(int number){
    String result = "Nan";
    int restOfMod= number%10;

    switch (restOfMod) {      
      case 1:
        result= number.toString()+"st";
        break;
      case 2:
        result= number.toString()+"nd";
        break;
      case 3:
        result= number.toString()+"rd";
        break;      
      default:
        result= number.toString()+"th";        
    }
    return result;
  }  
}
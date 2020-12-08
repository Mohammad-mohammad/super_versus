import 'package:flutter/material.dart';

class MyColor {
  static Color primaryColor(){
    //return Color.fromRGBO(116, 176, 76, 1); 
    return Color.fromRGBO(123, 203, 187, 1); 
  }
  static Color primaryColorOp(double op){
    //return Color.fromRGBO(116, 176, 76, op);
    return Color.fromRGBO(123, 203, 187, op); 
  }  
  static Color secondColor(){
    return Color.fromRGBO(77, 67, 76, 1);
    //return Color.fromRGBO(155, 32, 65, 1);
  }
  static Color secondColorOp(double op){
    return Color.fromRGBO(77, 67, 76, op);
    //return Color.fromRGBO(155, 32, 65, op);
  }
  static Color creamyColor(){
    return Color.fromRGBO(247, 247, 247, 1);
    //return Color.fromRGBO(224, 241, 239, 1);
  }
  static Color creamyColor2(){
    return Color.fromRGBO(234, 234, 234, 1);
  }
}
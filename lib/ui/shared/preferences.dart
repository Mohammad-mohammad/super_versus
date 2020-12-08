import 'package:flutter/material.dart';

class Preferences{
  final String name;
  double value;

  Preferences({@required this.name,@required this.value});
  
  void setValue(double v){
    value=v;
  }
}
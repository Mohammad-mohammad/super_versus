
import 'package:decidable/ui/shared/myColor.dart';
import 'package:flutter/material.dart';

class TextFieldBorder extends InputDecoration {
  
  TextFieldBorder({prefixIcon, hintText, suffixIcon}):
    super(hintText: hintText, prefixIcon: prefixIcon, suffixIcon: suffixIcon);
  
  final contentPadding= EdgeInsets.all(10.0);
    
  final enabledBorder = new OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(color: MyColor.creamyColor2(), width: 2),
  );
  final focusedBorder = new OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(color: MyColor.creamyColor2(), width: 2),
  );

}

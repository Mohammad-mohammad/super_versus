import 'package:decidable/ui/shared/myColor.dart';
import 'package:flutter/material.dart';

Widget imporatnceCircle(int value) {
  return Container(
    margin: EdgeInsets.all(5),
    child: ClipOval(
      child: Container(
        color: MyColor.primaryColor(),
        height: 20.0,
        width: 20.0,
        child: Center(
            child: Text(
          value.toString(),
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        )),
      ),
    ),
  );
}
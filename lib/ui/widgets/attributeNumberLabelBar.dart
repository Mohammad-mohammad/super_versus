import 'package:decidable/ui/shared/myColor.dart';
import 'package:decidable/ui/shared/utilities.dart';
import 'package:flutter/material.dart';

class AttributeNumberLabelBar extends StatelessWidget {
  final int number;

  AttributeNumberLabelBar(this.number);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: MyColor.creamyColor(),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(Utilities.getOrdinalNumber(number),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: MyColor.primaryColor())),
          Text("Attribute",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: MyColor.secondColor())),
        ],
      ),
    );
  }
}

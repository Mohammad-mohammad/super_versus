import 'package:decidable/core/models/vs.dart';
import 'package:decidable/ui/shared/myColor.dart';
import 'package:decidable/ui/widgets/importanceCircle.dart';
import 'package:flutter/material.dart';

class PrevAttributeValue extends StatelessWidget {
  final Attribute attribute;
  final TextEditingController valueCtrl;

  final Function afterCopyFun;
  PrevAttributeValue({this.attribute, this.valueCtrl, this.afterCopyFun});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 45,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: MyColor.creamyColor(),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
              flex: 10,
              child: Text(
                attribute.value,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
              )),
          Expanded(
            flex: 1,
            child: IconButton(
                icon: Icon(
                  Icons.copy,
                  color: MyColor.primaryColor(),
                ),
                onPressed: () {
                  valueCtrl.text = attribute.value;
                  afterCopyFun();
                },),
          ),
          Expanded(
            flex: 1,
            child: imporatnceCircle(attribute.valueImportance),
          ),
        ],
      ),
    );
  }
}

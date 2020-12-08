import 'package:decidable/ui/shared/myColor.dart';
import 'package:flutter/material.dart';

class NextButtonnBar extends StatelessWidget {
  final Function _function;
  NextButtonnBar(this._function);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: MaterialButton(
          onPressed: _function,
          elevation: 5,
          color: MyColor.creamyColor(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Next",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Icon(
                Icons.chevron_right,
                color: MyColor.secondColor(),
              ),
            ],
          ),
          textColor: MyColor.primaryColor(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
      padding: EdgeInsets.only(right: 10),
    );
  }
}

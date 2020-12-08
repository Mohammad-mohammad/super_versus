import 'package:decidable/ui/shared/myColor.dart';
import 'package:flutter/material.dart';

class PrevButtonBar extends StatelessWidget {
  final Function _function;
  PrevButtonBar(this._function);
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
              Icon(
                Icons.chevron_left,
                color: MyColor.secondColor(),
              ),
              Text(
                "Prev",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          textColor: MyColor.primaryColor(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
      padding: EdgeInsets.only(left: 10),
    );
  }
}

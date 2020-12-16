import 'package:decidable/ui/shared/myColor.dart';
import 'package:flutter/material.dart';

class NextButtonnBar extends StatelessWidget {
  final String btnName;
  final Function function;
  NextButtonnBar({this.function, this.btnName="Next"});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: MaterialButton(
          onPressed: function,
          elevation: 5,
          color: MyColor.creamyColor(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                btnName,
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

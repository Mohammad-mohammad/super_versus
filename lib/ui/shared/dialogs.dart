import 'package:decidable/core/models/vs.dart';
import 'package:decidable/ui/shared/myColor.dart';
import 'package:flutter/material.dart';

class Dialogs {
  
  static showConfirmDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Are you sure?"),
              content: new Text(
                  "You are about to lose the progress that you made!"),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: MyColor.primaryColor()),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text(
                    'Yes, Delete',
                    style: TextStyle(color: MyColor.primaryColor()),
                  ),
                  onPressed: () { 
                    Vs.reset();                   
                    Navigator.popUntil(
                                context, 
                                ModalRoute.withName(Navigator.defaultRouteName),
                              );
                  },
                )
              ],
            ));
  
  }

  static showInfoDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Info"),
              content: new Text(
                  "more info more info more info more info more info ..... ...."),
              actions: <Widget>[
                RaisedButton(
                  color: MyColor.primaryColor(),
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}

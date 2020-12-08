import 'package:decidable/ui/shared/myColor.dart';
import 'package:flutter/material.dart';

class UploadPictureButton extends StatelessWidget {
  final Function _function;
  UploadPictureButton(this._function);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: MaterialButton(
          onPressed: _function,
          elevation: 5,
          color: MyColor.creamyColor2(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Upload",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(width: 10,),
              Icon(
                Icons.cloud_upload,  
                size: 35,              
              ),
            ],
          ),
          textColor: MyColor.primaryColor(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),      
    );
  }
}

import 'package:flutter/material.dart';
import 'package:decidable/ui/shared/myColor.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String primaryTitle;
  final String secondTitle;
  final String buttonText;
  final Icon buttonIcon;
  final Function goTo;
  final Function goBack;
  final _height = 120.0;

  CustomAppBar({@required this.primaryTitle,@required this.secondTitle, this.buttonText, this.buttonIcon, this.goTo, this.goBack});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
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
        margin: EdgeInsets.only(bottom: 10.0),
        height: _height,
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              color: MyColor.secondColor(),
                              onPressed: goBack,                              
                            ),
                            Text(
                                primaryTitle,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: MyColor.secondColor()),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(                        
                          secondTitle,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: MyColor.primaryColor()),
                        ),
                      )
                    ],
                  ),
                )),
                if(buttonText!=null)
            Expanded(
              flex: 2,
              child: MaterialButton(
                  padding: EdgeInsets.only(left: 10),
                  height: 50,
                  onPressed: goTo,
                  elevation: 5,
                  color: MyColor.primaryColor(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(buttonText),
                      buttonIcon,
                    ],
                  ),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0)),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  @override  
  Size get preferredSize => Size(double.infinity, _height);
}

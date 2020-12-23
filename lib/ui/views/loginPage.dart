import 'package:decidable/ui/shared/myColor.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double dividerWidth = MediaQuery.of(context).size.width / 2 - 50;

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: SingleChildScrollView(                        
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height-50,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/icon.png", width: 100),
                  Text(
                    "Log into your account",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                      decoration: new InputDecoration(labelText: "Email"),
                      keyboardType: TextInputType.emailAddress),
                  TextField(
                    decoration: new InputDecoration(labelText: "Password"),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 5,
                      padding: EdgeInsets.all(12),
                      color: MyColor.primaryColor(),
                      onPressed: () {},
                      child: Text(
                        "Log in",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                  FlatButton(
                      onPressed: () {},
                      child: Text("Forgot Password?",
                          style: TextStyle(
                              color: Color.fromRGBO(110, 110, 110, 1),
                              fontSize: 14))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Color.fromRGBO(110, 110, 110, 1),
                        height: 1,
                        width: dividerWidth,
                      ),
                      Text("Or",
                          style: TextStyle(
                              color: Color.fromRGBO(110, 110, 110, 1),
                              fontSize: 14)),
                      Container(
                        color: Color.fromRGBO(110, 110, 110, 1),
                        height: 1,
                        width: dividerWidth,
                      ),
                    ],
                  ),
                  socialMediaBtn(
                      "Sign in with Google",
                      "assets/images/google.png",
                      Color.fromRGBO(241, 67, 54, 1)),
                  socialMediaBtn(
                      "Sign in with Facebook",
                      "assets/images/facebook.png",
                      Color.fromRGBO(40, 94, 188, 1)),
                  socialMediaBtn(
                      "Sign in with Twitter",
                      "assets/images/twitter.png",
                      Color.fromRGBO(0, 203, 225, 1)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget socialMediaBtn(String title, String iconUrl, Color edgColor) {
  return FlatButton(
    padding: EdgeInsets.all(12),
    color: Colors.white,
    child: Stack(
      children: [
        Positioned(
            child: Image.asset(
          iconUrl,
          width: 20,
          height: 20,
        )),
        Positioned(
            child: Center(
                child: Text(
          title,
          style:
              TextStyle(color: Color.fromRGBO(110, 110, 110, 1), fontSize: 14),
        ))),
      ],
    ),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
        side: BorderSide(color: edgColor, width: 1.5)),
    onPressed: () {},
  );
}

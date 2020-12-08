import 'package:decidable/main.dart';
import 'package:decidable/ui/shared/SlideLeftRoute.dart';
import 'package:decidable/ui/shared/myColor.dart';
import 'package:decidable/ui/views/setPreferencesPage.dart';
import 'package:decidable/ui/widgets/importanceCircle.dart';
import 'package:flutter/material.dart';

double screenWidth;
double marginSize = 2.0;


class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    void goBack(){
    Navigator.pushReplacement(context, SlideleftRoute(page: SetPreferencesPage()));
  }
    screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: ()async{
        goBack();
        return true;
      },
          child: Scaffold(
        appBar: CustomAppBarResult(goBack: goBack,),
        body: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildRows(20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> _buildCells(int count) {
  return List.generate(
    count,
    (index) => Card(
      margin: EdgeInsets.all(marginSize),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: (screenWidth - marginSize * 4) / 2,
            height: 100.0,
            color: Colors.white,
            child: Text("value value value value value value value value value value"),
          ),
          imporatnceCircle(index),
        ],
      ),
    ),
  );
}



List<Widget> _buildRows(int count) {
  return List.generate(
    count,
    (index) => Row(
      children: _buildCells(10),
    ),
  );
}

class CustomAppBarResult extends StatelessWidget implements PreferredSizeWidget {
  final _height = 80.0;
  final Function goBack;
  CustomAppBarResult({this.goBack});
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
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
                          //should back to preffernce
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => MyHomePage()),
                          // ),
                        ),
                        Text(
                          "Result",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: MyColor.secondColor()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            Container(
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      }),
                  IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, _height);
}
import 'package:decidable/core/models/product.dart';
import 'package:decidable/ui/widgets/searchResultItem.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Product product = new Product(id: "1", name: "Apple 11 pro max xxl");
  double top = 0;
  bool _visible = true;

  void move() {
    setState(() {
      top = MediaQuery.of(context).size.height+200;
      _visible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(          
          children: [
            AnimatedPositioned(                           
              top: top,
              duration: Duration(seconds: 1),
              child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: _visible ? 1.0 : 0.0,
                child: SearchResultItem(
                  product: product,
                  function: move,
                ),
              ),
            ),            
          ],
        ),
      ),
    );
  }
}

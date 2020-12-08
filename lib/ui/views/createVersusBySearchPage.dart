import 'dart:async';
import 'package:decidable/core/models/product.dart';
import 'package:decidable/core/services/services.dart';
import 'package:decidable/main.dart';
import 'package:decidable/ui/shared/SlideLeftRoute.dart';
import 'package:decidable/ui/shared/myColor.dart';
import 'package:decidable/ui/shared/textFieldBorder.dart';
import 'package:decidable/ui/views/setPreferencesPage.dart';
import 'package:decidable/ui/widgets/customAppBar.dart';
import 'package:decidable/ui/widgets/searchResultAddedItem.dart';
import 'package:decidable/ui/widgets/searchResultItem.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class CreateVersusBySearchPage extends StatefulWidget {
  @override
  _CreateVersusBySearchPageState createState() =>
      _CreateVersusBySearchPageState();
}

class _CreateVersusBySearchPageState extends State<CreateVersusBySearchPage>
    with TickerProviderStateMixin {
  PanelController _pc = new PanelController();
  IconData headerIcon = Icons.keyboard_arrow_up;
  final _debouncer = Debouncer(milliseconds: 500);
  List<Product> filteredProducts = List();
  List<Product> comparedProducts = List();
  

  int headerHeight = 120;
  int panelHeaderheight = 47;
  int textFeildHeight = 50;

  bool isLoading = false;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: Duration(seconds: 1),
    );    
  }

  void animate() {
    _controller.reset();
    _controller.forward();
  }

  void goto() {
    Navigator.pushReplacement(
        context, SlideleftRoute(page: SetPreferencesPage()));
  }

  void goBack() {
    Navigator.pop(context, SlideleftRoute(page: MyHomePage()));
  }

  void addToCompare(Product product) {
    setState(() {
      if (!comparedProducts.contains(product)){
        comparedProducts.add(product);
        animate();
      } 
    });
  }

  void removeFromCompare(Product product) {
    setState(() {
      comparedProducts.remove(product);
      animate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        goBack();
        return true;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          primaryTitle: "Create",
          secondTitle: "Find and compare",
          buttonText: "Go",
          buttonIcon: Icon(Icons.check),
          goTo: goto,
          goBack: goBack,
        ),
        body: SlidingUpPanel(
          controller: _pc,
          onPanelSlide: (position) {
            setState(() {
              if (position > 0)
                headerIcon = Icons.keyboard_arrow_down;
              else
                headerIcon = Icons.keyboard_arrow_up;
            });
          },
          panel: Container(
            color: MyColor.creamyColor(),
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: ListView.builder(
                  itemCount: comparedProducts.length,
                  itemBuilder: (context, index) {
                    return SearchResultAddedItem(
                      product: comparedProducts[index],
                      function: () =>
                          removeFromCompare(comparedProducts[index]),
                    );
                  }),
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
               TextField(
                  decoration: TextFieldBorder(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (query) async {
                    setState(() {
                      isLoading = true;
                    });
                    _debouncer.run(() {
                      Services.search(query).then((productsFromServer) {
                        setState(() {
                          isLoading = false;
                          if (query == null || query.length == 0) {
                            filteredProducts.clear();
                          } else {
                            filteredProducts = productsFromServer;
                          }
                        });
                      });
                    });
                  },
                ),
                isLoading
                    ? Container(
                        height: 50,
                        padding: EdgeInsets.only(top: 10),
                        child: Center(
                            child: CircularProgressIndicator(
                          backgroundColor: MyColor.creamyColor(),
                          valueColor: AlwaysStoppedAnimation<Color>(
                              MyColor.primaryColor()),
                        )),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height -
                            headerHeight -
                            panelHeaderheight -
                            textFeildHeight -
                            50,
                        child: ListView.builder(
                            itemCount: filteredProducts.length,
                            itemBuilder: (context, index) {
                              return SearchResultItem(
                                product: filteredProducts[index],
                                function: () =>
                                    addToCompare(filteredProducts[index]),
                              );
                            }),
                      ),
              ],
            ),
          ),
          minHeight: 47.0,
          maxHeight: 300,
          header: Container(
            color: MyColor.primaryColor(),
            width: MediaQuery.of(context).size.width,
            child: FlatButton(
              onPressed: () {
                setState(() {
                  if (_pc.isPanelOpen) {
                    _pc.close();
                  } else {
                    _pc.open();
                  }
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Text(
                          "Added items",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              _ripple(_controller, 50),
                              _counter(26, comparedProducts.length.toString()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    headerIcon,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _ripple(AnimationController controller, double radius) {
  return AnimatedBuilder(
    animation: CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
    builder: (context, child) {
      return Container(
        alignment: Alignment.center,
        child: Container(
          width: radius * controller.value,
          height: radius * controller.value,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: MyColor.secondColor().withOpacity(1 - controller.value),
          ),
        ),
      );
    },
  );
}

Widget _counter(double radius, String text) {
  return Container(
    width: radius,
    height: radius,
    decoration:
        BoxDecoration(shape: BoxShape.circle, color: MyColor.creamyColor()),
    child: Center(
        child: Text(text,
            style: TextStyle(
                color: MyColor.primaryColor(), fontWeight: FontWeight.bold))),
  );
}

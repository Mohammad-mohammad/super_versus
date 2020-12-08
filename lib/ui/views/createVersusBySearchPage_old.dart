import 'package:decidable/core/models/product.dart';
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

class CreateVersusBySearchPage extends StatefulWidget {
  @override
  _CreateVersusBySearchPageState createState() =>
      _CreateVersusBySearchPageState();
}

class _CreateVersusBySearchPageState extends State<CreateVersusBySearchPage> {
  PanelController _pc = new PanelController();
  IconData headerIcon = Icons.keyboard_arrow_up;
  //StreamController<Product> _streamController = StreamController<Product>();

  void goto() {
    Navigator.pushReplacement(
        context, SlideleftRoute(page: SetPreferencesPage()));
  }

  void goBack() {
    Navigator.pop(context, SlideleftRoute(page: MyHomePage()));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController;
    // ProductModel model = ProductModel(api: Provider.of(context));
    List<Product> products = [];

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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SearchResultAddedItem(),
                    SearchResultAddedItem(),
                    SearchResultAddedItem(),
                    SearchResultAddedItem(),
                    SearchResultAddedItem(),
                  ],
                ),
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: TextFieldBorder(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                  // onChanged: (value) async {
                  //   await model.search(value);
                  //   print(model.products);
                  //   setState(() {
                  //     products=model.products;
                  //     for (var item in model.products) {
                  //     _streamController.add(item);
                  //   }
                  //   });                    
                  // },
                ),
                Container(
                  color: Colors.amber[100],
                  height: 430,
                  child: StreamBuilder<Product>(
                   // stream: _streamController.stream,
                    builder: (context, snapshot) {
                      return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return SearchResultItem(
                          product: snapshot.data,
                        );
                      });
                    },)
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
                          width: 22,
                          height: 22,
                          child: Center(
                              child: Text(
                            "4",
                            style: TextStyle(
                                color: MyColor.primaryColor(),
                                fontWeight: FontWeight.bold),
                          )),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFFe0f2f1)),
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

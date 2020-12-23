import 'package:decidable/core/models/product.dart';
import 'package:decidable/core/services/services.dart';
import 'package:decidable/main.dart';
import 'package:decidable/ui/shared/SlideLeftRoute.dart';
import 'package:decidable/ui/shared/myColor.dart';
import 'package:decidable/ui/views/setPreferencesPage.dart';
import 'package:decidable/ui/widgets/searchResultAddedItem.dart';
import 'package:decidable/ui/widgets/searchResultItem.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


List<Product> comparedProducts = List();

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>{



  int headerHeight = 120;
  int panelHeaderheight = 47;
  int textFeildHeight = 50;
 
 

  void goto() {
    Navigator.pushReplacement(
        context, SlideleftRoute(page: SetPreferencesPage()));
  }

  void goBack() {
    Navigator.pop(context, SlideleftRoute(page: MyHomePage()));
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: ItemSearch());
              }),
        ],
      ),
     // body: 
    );
  }
}

class AddedItemsPanel extends StatefulWidget{
  
  @override
  _AddedItemsPanelState createState() => _AddedItemsPanelState();
}

class _AddedItemsPanelState extends State<AddedItemsPanel> with TickerProviderStateMixin  {
  PanelController _pc = new PanelController();
  IconData headerIcon = Icons.keyboard_arrow_up;
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

  void removeFromCompare(Product product) {
    comparedProducts.remove(product);
    //animate();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
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
        );
  }
}

class ItemSearch extends SearchDelegate {
  List<Product> filteredProducts = List();  

  void addToCompare(Product product) {
    if (!comparedProducts.contains(product)) {
      comparedProducts.add(product);
      //animate();
    }
  }


  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query= "";
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Widget temp;
    if (query.isEmpty) {
      filteredProducts.clear();
      temp = Center(child: Text("No result"));      
    } else {      
      temp = Container(
        height: 250,
        child: FutureBuilder(
          future: Services.search(query),
          builder: (context, filteredData) {
            if (filteredData.connectionState == ConnectionState.none && filteredData.hasData == null) {
              return Text("no result");
            }
            return ListView.builder(
              itemCount: filteredData.data==null?0:filteredData.data.length,
              itemBuilder: (context, index) {
                Product p = filteredData.data[index];
                return SearchResultItem(
                  product: p,
                  function: () => addToCompare(p),
                  query: query,
                );
              },
            );
          },
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        temp,
        AddedItemsPanel()
      ],
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

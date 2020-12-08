import 'package:decidable/core/models/vs.dart';
import 'package:decidable/main.dart';
import 'package:decidable/ui/shared/SlideLeftRoute.dart';
import 'package:decidable/ui/shared/dialogs.dart';
import 'package:decidable/ui/shared/myColor.dart';
import 'package:decidable/ui/views/newItemInitPage.dart';
import 'package:decidable/ui/widgets/customAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateVersusCustomizedPage extends StatefulWidget {
  @override
  _CreateVersusCustomizedPageState createState() =>
      _CreateVersusCustomizedPageState();
}

class _CreateVersusCustomizedPageState
    extends State<CreateVersusCustomizedPage> {
  
  
  int _value = 1;
  List<ListItem> _dropdownItems = [
    ListItem(1, "Choose a defined template"),
    ListItem(2, "No Template"),
    ListItem(3, "Mobile"),
    ListItem(4, "Computer")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  

@override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;    
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }
  
  void goTo(){    
    Navigator.pushReplacement(context, SlideleftRoute(page: NewItemInitPage()));
  }
  void goBack(){
    Navigator.pop(context, SlideleftRoute(page: MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
          onWillPop: () async{ 
            goBack();
            return true;
           },
          child: Scaffold(
        appBar: CustomAppBar(
          primaryTitle: "Create",
          secondTitle: "Fill These Settings",
          buttonText: "Go",
          buttonIcon: Icon(Icons.check),
          goTo: goTo,
          goBack: goBack,
        ),
        body: SingleChildScrollView(
                  child: Container(
            //padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, right:15),
                  child: Column(
                    children: [
                      Container(
                  margin: EdgeInsets.only(bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Template",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                      border: Border.all(color: MyColor.creamyColor2())),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        value: _selectedItem,
                        items: _dropdownMenuItems,
                        onChanged: (value) {
                          setState(() {
                            _selectedItem = value;
                          });
                        }),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    "if you choose a template, then the attributes will be already defined",
                    style: TextStyle(
                      color: MyColor.secondColorOp(0.5),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Compared Items",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                      border: Border.all(color: MyColor.creamyColor2())),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        value: _value,
                        items: [
                          DropdownMenuItem(
                              child: Text("Number of compared items"), value: 1),
                          DropdownMenuItem(child: Text("2"), value: 2)
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        }),
                  ),
                ),
                    ],
                  ),
                ),

                SizedBox(height: 10),
                Container(
                  child: Row( 
                    children: [
                      IconButton(icon: Icon(Icons.info), onPressed: () => Dialogs.showInfoDialog(context)),
                      Text(
                        "Beta version (Max. 2)",
                        style: TextStyle(
                          color: MyColor.secondColor(),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.horizontal,
                    children: [
                      customCheckBox(Vs.ignoreImportance),
                      Text("Ignore importance of the attributes", style: TextStyle(fontSize: 15)),
                      IconButton(icon: Icon(Icons.info), onPressed: () => Dialogs.showInfoDialog(context)),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      customCheckBox(Vs.isPublic),
                      Text("Make it public", style: TextStyle(fontSize: 16)),
                      IconButton(icon: Icon(Icons.info), onPressed: () => Dialogs.showInfoDialog(context)),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      customCheckBox(Vs.havePhoto),
                      Text("Without Pictures", style: TextStyle(fontSize: 16)),
                      IconButton(icon: Icon(Icons.info), onPressed: () => Dialogs.showInfoDialog(context)),
                    ],
                  ),
                ),          
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

Widget customCheckBox(bool checked) {
  return new StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return new Transform.scale(
        scale: 1,
        child: new Checkbox(
          activeColor: MyColor.primaryColor(),
          value: checked,
          onChanged: (bool value) {
            setState(() {
              checked = value;              
            });
          },
        ),
      );
    },
  );
}

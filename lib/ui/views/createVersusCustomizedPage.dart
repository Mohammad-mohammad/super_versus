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
  
  
  List<ListItem> _templateDropdownItems = [
    ListItem(1, "Free concept - No Template"),
    ListItem(2, "Mobile"),
    ListItem(3, "Computer")
  ];
  List<DropdownMenuItem<ListItem>> _templateDropdownMenuItems;
  ListItem _selectedTemplate;

  List<ListItem> _itemNumberDropdownItems = [
    ListItem(1, "2"),
    ListItem(2, "3"),
    ListItem(3, "4")
  ];
  List<DropdownMenuItem<ListItem>> _itemNumberDropdownMenuItems;
  ListItem _selectedItemNumber;

  @override
  void initState() {
    _templateDropdownMenuItems = buildDropDownMenuItems(_templateDropdownItems);
    _selectedTemplate = _templateDropdownMenuItems[0].value;
  
    _itemNumberDropdownMenuItems = buildDropDownMenuItems(_itemNumberDropdownItems);
    _selectedItemNumber = _itemNumberDropdownMenuItems[0].value;

    super.initState();
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

  void goTo() {
    Vs.templateId =  _selectedTemplate.value;  
    int value = int.tryParse(_selectedItemNumber.name);
    if(value==null){
      Vs.itemsNumber = 2;
    }else{
      Vs.itemsNumber = value;
    }
    Navigator.pushReplacement(context, SlideleftRoute(page: NewItemInitPage()));
  }

  void goBack() {
    Navigator.pop(context, SlideleftRoute(page: MyHomePage()));
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
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Choose a defined template",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
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
                              value: _selectedTemplate,
                              items: _templateDropdownMenuItems,
                              onChanged: (value) {
                                setState(() {
                                  _selectedTemplate = value;
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
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
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
                              value: _selectedItemNumber,
                              items: _itemNumberDropdownMenuItems,
                              onChanged: (value) {
                                setState(() {
                                  _selectedItemNumber = value;
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
                      IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () => Dialogs.showInfoDialog(context)),
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
                      customCheckBox(checkBoxLabels.ignoreImportance),
                      Text("Ignore importance of the attributes",
                          style: TextStyle(fontSize: 15)),
                      IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () => Dialogs.showInfoDialog(context)),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      customCheckBox(checkBoxLabels.isPublic),
                      Text("Make it public", style: TextStyle(fontSize: 16)),
                      IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () => Dialogs.showInfoDialog(context)),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      customCheckBox(checkBoxLabels.havePhoto),
                      Text("Without Pictures", style: TextStyle(fontSize: 16)),
                      IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () => Dialogs.showInfoDialog(context)),
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

enum checkBoxLabels { ignoreImportance, isPublic, havePhoto }

Widget customCheckBox(checkBoxLabels e) {
  bool checked;
  switch (e) {
    case checkBoxLabels.ignoreImportance:
      checked = Vs.ignoreImportance;
      break;
    case checkBoxLabels.isPublic:
      checked = Vs.isPublic;
      break;
    case checkBoxLabels.havePhoto:
      checked = Vs.havePhoto;
      break;
  }
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
              switch (e) {
                case checkBoxLabels.ignoreImportance:
                  Vs.ignoreImportance = value;
                  break;
                case checkBoxLabels.isPublic:
                  Vs.isPublic = value;
                  break;
                case checkBoxLabels.havePhoto:
                  Vs.havePhoto = value;
                  break;
              }
            });
          },
        ),
      );
    },
  );
}

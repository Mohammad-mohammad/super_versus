import 'package:decidable/core/models/vs.dart';
import 'package:decidable/ui/shared/SlideLeftRoute.dart';
import 'package:decidable/ui/shared/SlideRightRoute.dart';
import 'package:decidable/ui/shared/customTrackShape.dart';
import 'package:decidable/ui/shared/dialogs.dart';
import 'package:decidable/ui/shared/myColor.dart';
import 'package:decidable/ui/shared/textFieldBorder.dart';
import 'package:decidable/ui/shared/utilities.dart';
import 'package:decidable/ui/views/newItemInitPage.dart';
import 'package:decidable/ui/views/setPreferencesPage.dart';
import 'package:decidable/ui/widgets/attributeNumberLabelBar.dart';
import 'package:decidable/ui/widgets/customAppBar.dart';
import 'package:decidable/ui/widgets/customSliderThumbCircle%20.dart';
import 'package:decidable/ui/widgets/fieldTitle.dart';
import 'package:decidable/ui/widgets/nextButtonBar.dart';
import 'package:decidable/ui/widgets/preAttributeValue.dart';
import 'package:decidable/ui/widgets/prevButtonBar.dart';
import 'package:flutter/material.dart';

class NewAttributeTextualPage extends StatefulWidget {
  @override
  _NewAttributeTextualPageState createState() =>
      _NewAttributeTextualPageState();
}

class _NewAttributeTextualPageState extends State<NewAttributeTextualPage>
    with SingleTickerProviderStateMixin {
  final attrNameCtrl = new TextEditingController();
  final valueCtrl = new TextEditingController();
  double _currentSliderValue = 10;
  String _nextItemLabel = "Next Item";
  String btnNextName = "Next";
  Function btnNextFun;
  Function btnPrevFun;
  Function gotoFun;

  @override
  void initState() {
    if (Vs.isFinish()) _nextItemLabel = "Finish";
    btnNextFun = null;
    Attribute attr = Vs.getCurrentAttribute();
    if (attr != null) {
      attrNameCtrl.text = attr.name;
      valueCtrl.text = attr.value;
      _currentSliderValue = attr.valueImportance.toDouble() * 10;
      btnNextFun = goNext;
    }
    if (Vs.currentAttrIndex != 0) {
      btnPrevFun = goPreviuos;
    } else {
      btnPrevFun = null;
    }
    if (Vs.attributesLengthLimit()) {
      btnNextName = "Finish";
    } else {
      btnNextName = "Next";
    }
    if (Vs.validateNextItem() &&
        Vs.currentAttrIndex > 0 &&
        Vs.currentItemIndex == 0) {
      gotoFun = goto;
    } else {
      gotoFun = null;
    }
    super.initState();
  }

  void goNext() {
    if (Vs.attributesLengthLimit()) {
      goto();
    } else if (validate()) {
      add();
      Vs.nextAttribute();
      Navigator.pushReplacement(
          context, SlideleftRoute(page: NewAttributeTextualPage()));
    }
  }

  void goPreviuos() {
    Vs.preAttribute();
    Navigator.pushReplacement(
        context, SlideRightRoute(page: NewAttributeTextualPage()));
  }

  void goto() {
    if (validate()) {
      add();
    }
    if (Vs.isFinish()) {
      Navigator.pushReplacement(
          context, SlideleftRoute(page: SetPreferencesPage()));
    } else {
      Vs.resetForNewItem();
      Navigator.pushReplacement(
          context, SlideleftRoute(page: NewItemInitPage()));
    }
  }

  void goBack() {
    Dialogs.showConfirmDialog(context);
  }

  void add() {
    Vs.addAttribute(new Attribute(
        name: attrNameCtrl.text,
        value: valueCtrl.text,
        valueImportance: (_currentSliderValue / 10).round()));
  }

  bool validate() {
    bool result = false;
    int maxLength = Utilities.maxValidTextLength;
    if (Vs.currentItemIndex == 0) {
      if (attrNameCtrl.text.trim().length > maxLength &&
          valueCtrl.text.trim().length > maxLength) {
        turnOnBtn();
        result = true;
      } else {
        turnOffBtn();
        result = false;
      }
    } else if (valueCtrl.text.trim().length > maxLength) {
      turnOnBtn();
      result = true;
    } else {
      turnOffBtn();
      result = false;
    }
    return result;
  }

  void turnOnBtn() {
    setState(() {
      btnNextFun = goNext;
      if (Vs.validateNextItem()) {
        gotoFun = goto;
      }
    });
  }

  void turnOffBtn() {
    setState(() {
      btnNextFun = null;
      gotoFun = null;
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
        //resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          primaryTitle: "Comparasion",
          secondTitle: Vs.getCurrentItemName(),
          buttonText: _nextItemLabel,
          buttonIcon: Icon(Icons.add),
          goTo: gotoFun,
          goBack: goBack,
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      // color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          attributeName(attrNameCtrl, validate),
                          SizedBox(
                            height: 10,
                          ),
                          FieldTitle("Value"),
                          TextField(
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 5,
                            decoration: TextFieldBorder(),
                            controller: valueCtrl,
                            onChanged: (_) {
                              validate();
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Importance",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: MyColor.primaryColor(),
                                inactiveTrackColor: MyColor.creamyColor2(),
                                trackShape: CustomTrackShape(),
                                trackHeight: 5.0,
                                thumbColor: Colors.white,
                                thumbShape: CustomSliderThumbCircle(
                                    thumbRadius: 15, max: 10, min: 0),
                                overlayColor:
                                    MyColor.primaryColor().withAlpha(32),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 28.0),
                              ),
                              child: Slider(
                                
                                min: 0,
                                max: 100,
                                value: _currentSliderValue,
                                onChanged: (value) {
                                  setState(() {
                                    _currentSliderValue = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          ...Vs.getPrevAttributesFromPrevItems()
                              .map((attribute) {
                            return PrevAttributeValue(
                                attribute: attribute,
                                valueCtrl: valueCtrl,
                                afterCopyFun: validate);
                          }).toList(),
                        ],
                      ),
                    ),
                  ),
                ),
                flex: 1,
              ),
              Container(
                height: 70,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PrevButtonBar(btnPrevFun),
                    AttributeNumberLabelBar(Vs.currentAttrIndex + 1),
                    NextButtonnBar(btnName: btnNextName, function: btnNextFun),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget attributeName(TextEditingController attrNameCtrl, Function validate) {
  if (Vs.currentItemIndex == 0)
    return Column(
      children: [
        FieldTitle("Attribute Name"),
        Container(
          height: 50,
          child: TextField(
              decoration: TextFieldBorder(),
              controller: attrNameCtrl,
              onChanged: (_) {
                validate();
              }),
        ),
      ],
    );
  else
    return FieldTitle(Vs.getCurrentAttributeName());
}

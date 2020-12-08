import 'package:decidable/core/models/vs.dart';
import 'package:decidable/ui/shared/SlideLeftRoute.dart';
import 'package:decidable/ui/shared/SlideRightRoute.dart';
import 'package:decidable/ui/shared/customTrackShape.dart';
import 'package:decidable/ui/shared/dialogs.dart';
import 'package:decidable/ui/shared/myColor.dart';
import 'package:decidable/ui/shared/textFieldBorder.dart';
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
  String _nextItemLabel = "Next Item";

  @override
  void initState() {
    if(Vs.isFinish())
      _nextItemLabel = "Finish";
    super.initState();
  }

  void goNext() {
    Vs.addAttribute(new Attribute(
        name: attrNameCtrl.text,
        value: valueCtrl.text,
        importance: (_currentSliderValue / 10).round()));
    Navigator.pushReplacement(
        context, SlideleftRoute(page: NewAttributeTextualPage()));
  }

  void goPreviuos() {
    Navigator.pushReplacement(
        context, SlideRightRoute(page: NewAttributeTextualPage()));
  }

  void goto() {
    print(Vs.toStringx());
    if (Vs.isFinish()) {
      Navigator.pushReplacement(context, SlideleftRoute(page: SetPreferencesPage()));
    } else {
      Vs.resetForNewItem();
      Navigator.pushReplacement(context, SlideleftRoute(page: NewItemInitPage()));
    }
  }

  void goBack() {
    Dialogs.showConfirmDialog(context);
  }

  double _currentSliderValue = 20;

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
          goTo: goto,
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
                          attributeName(attrNameCtrl),
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
                          ...Vs.getPrevAttributesFromPrevItems().map((e) {
                            return PrevAttributeValue(e);
                          }).toList(),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // PrevAttributeValue(),
                          // SizedBox(
                          //   height: 10,
                          // ),PrevAttributeValue(),
                          // SizedBox(
                          //   height: 10,
                          // ),PrevAttributeValue(),
                          // SizedBox(
                          //   height: 10,
                          // ),PrevAttributeValue(),
                          // SizedBox(
                          //   height: 10,
                          // ),PrevAttributeValue(),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // PrevAttributeValue(),
                          // SizedBox(
                          //   height: 20,
                          // ),
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
                    PrevButtonBar(goPreviuos),
                    AttributeNumberLabelBar(Vs.currentAttrIndex),
                    NextButtonnBar(goNext),
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

Widget attributeName(TextEditingController attrNameCtrl) {
  if (Vs.currentItemIndex == 1)
    return Column(
      children: [
        FieldTitle("Attribute Name"),
        Container(
          height: 50,
          child: TextField(
            decoration: TextFieldBorder(),
            controller: attrNameCtrl,
          ),
        ),
      ],
    );
  else
    return FieldTitle(Vs.getCurrentAttributeName());
}

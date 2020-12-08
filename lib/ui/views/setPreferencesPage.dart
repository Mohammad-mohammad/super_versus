import 'package:decidable/ui/shared/SlideLeftRoute.dart';
import 'package:decidable/ui/shared/customTrackShape.dart';
import 'package:decidable/ui/shared/dialogs.dart';
import 'package:decidable/ui/shared/myColor.dart';
import 'package:decidable/ui/shared/preferences.dart';
import 'package:decidable/ui/views/resultPage.dart';
import 'package:decidable/ui/widgets/customAppBar.dart';
import 'package:decidable/ui/widgets/customSliderThumbCircle%20.dart';
import 'package:flutter/material.dart';

class SetPreferencesPage extends StatefulWidget {
  @override
  _SetPreferencesStatePage createState() => _SetPreferencesStatePage();
}


class _SetPreferencesStatePage extends State<SetPreferencesPage> {
  final List<Preferences> pref= [
    Preferences(name: "Attribute #1", value: 20), 
    Preferences(name: "Attribute #2", value: 50), 
    Preferences(name: "Attribute #3", value: 90), 
    Preferences(name: "Attribute #4", value: 10), 
    Preferences(name: "Attribute #5", value: 70), 
    Preferences(name: "Attribute #6", value: 10), 
    Preferences(name: "Attribute #7", value: 30), 
  ];

  void goto(){
    Navigator.pushReplacement(context, SlideleftRoute(page: ResultPage()));
  }
  void goBack(){
    Dialogs.showConfirmDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        goBack();
        return true;
      },
          child: Scaffold(
        appBar: CustomAppBar(
          primaryTitle: "Comparasion",
          secondTitle: "Attributes Preferences",
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[ 
                          Container(
                            margin: EdgeInsets.only(bottom: 25),
                            child: Text(
                              "Rate your attributes according to your preference to get the best choice for you",
                              style: TextStyle(
                                color: MyColor.secondColor(),
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),  
                          ...pref.map((elem) {
                            return Column(
                              children: [
                                Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                Text(
                                  elem.name,
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                //IconButton(icon: Icon(Icons.info), onPressed: null),
                              ],
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
                                overlayShape:
                                    RoundSliderOverlayShape(overlayRadius: 28.0),
                              ),
                              child: Slider(
                                min: 0,
                                max: 100,
                                value: elem.value,
                                onChanged: (value) {
                                  setState(() { 
                                    elem.setValue(value);
                                  });
                                },
                              ),
                            ),
                          ),  
                              ],
                            );
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
                padding: EdgeInsets.all(10),
                child: MaterialButton(
                    onPressed: goto,
                    elevation: 5,
                    color: MyColor.primaryColor(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Show Result",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.compare,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    textColor: MyColor.primaryColor(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

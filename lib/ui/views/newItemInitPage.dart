import 'package:decidable/core/models/vs.dart';
import 'package:decidable/ui/shared/SlideLeftRoute.dart';
import 'package:decidable/ui/shared/dialogs.dart';
import 'package:decidable/ui/shared/myColor.dart';
import 'package:decidable/ui/shared/textFieldBorder.dart';
import 'package:decidable/ui/views/newAttributeTextualPage.dart';
import 'package:decidable/ui/widgets/customAppBar.dart';
import 'package:decidable/ui/widgets/fieldTitle.dart';
import 'package:decidable/ui/widgets/uploadPictureButton.dart';
import 'package:flutter/material.dart';

class NewItemInitPage extends StatefulWidget {
  @override
  _NewItemInitPageState createState() => _NewItemInitPageState();
}

class _NewItemInitPageState extends State<NewItemInitPage> {
  final itemNameController = new TextEditingController();  

  @override
  void initState() {
    super.initState();    
  }

  void goto(){    
    Vs.addItem(itemNameController.text);
    Navigator.pushReplacement(context, SlideleftRoute(page: NewAttributeTextualPage()));
  }
  void goBack(){
    Dialogs.showConfirmDialog(context);
  }
  
   @override
  void dispose() {
    itemNameController.dispose();
    super.dispose();
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
      secondTitle: Vs.getTextualItemNumber(),
      buttonText: "Start",
      buttonIcon: Icon(Icons.add),
      goTo: goto,
      goBack: goBack,
          ),
          body: Container(
      //color: Colors.white,
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
                    children: [                        
                      FieldTitle("Item Name"),
                      Container(
                        height: 50,
                        child: TextField(
                          decoration: TextFieldBorder(),
                          controller: itemNameController,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),                        
                      FieldTitle("Picture"),
                      UploadPictureButton(() {
                        print("upload..");
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Image.asset(
                                      "assets/images/uploaded_img.png"),
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tungchivo-avatar.png",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColor.secondColorOp(0.5)),
                                    ),
                                    Text("428KB",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                MyColor.secondColorOp(0.5))),
                                  ],
                                ),
                              ],
                            ),
                            Icon(Icons.check_circle,
                                color: MyColor.primaryColor()),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: [
                          Container(
                            child: null,
                            width: (MediaQuery.of(context).size.width-20)*0.8,
                            height: 60,
                            color: MyColor.primaryColorOp(0.2),
                            alignment: Alignment.centerRight,
                          ),
                          Container(
                              alignment: Alignment.centerRight,
                              width: double.infinity,
                              height: 60,
                              padding: const EdgeInsets.only(right: 30),
                              child: Text("80%", style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color: MyColor.secondColorOp(0.3)),),
                          ),
                          Container(
                            height: 60,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 15.0),
                                      child: Image.asset(
                                          "assets/images/uploaded_img.png"),
                                    ),
                                    Text(
                                      "Tungchivo-avatar.png",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyColor.secondColorOp(0.5)),
                                    ),
                                  ],
                                ),
                                Icon(Icons.cancel, color: Colors.red),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            flex: 1,
          ),
          // Container(
          //   height: 70,
          //   padding: EdgeInsets.symmetric(vertical: 10),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       PrevButtonBar(null),
          //       AttributeNumberLabelBar(),
          //       NextButtonnBar(goto),
          //     ],
          //   ),
          // ),
        ],
      ),
          ),
        ),
    );
  }
}

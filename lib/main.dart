import 'package:decidable/core/viewmodels/versus_model.dart';
import 'package:decidable/provider_setup.dart';
import 'package:decidable/ui/shared/myColor.dart';
import 'package:decidable/ui/views/base_widget.dart';
import 'package:decidable/ui/views/createVersusBySearchPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/views/createVersusCustomizedPage.dart';
import 'ui/widgets/CustomDrawer.dart';
import 'ui/widgets/versusMainItem.dart';
import 'ui/shared/SlideLeftRoute.dart';
import 'ui/shared/textFieldBorder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: MyColor.primaryColor(),
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackPressed() {
      return showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit an App'),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'No',
                    style: TextStyle(color: MyColor.primaryColor()),
                  ),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                FlatButton(
                  child: Text(
                    'Yes',
                    style: TextStyle(color: MyColor.primaryColor()),
                  ),
                  onPressed: () => Navigator.of(context).pop(true),
                )
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: CustomAppBarHome(),
        body: BaseWidget<VersusModel>(
            model: VersusModel(api: Provider.of(context)),
            onModelReady: (model) => model.getVersus(1),
            builder: (context, model, child) {
              return model.busy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: model.versus.length,
                      itemBuilder: (context, index) {
                        return VersusMainItem(
                          verse: model.versus[index],
                        );
                      },
                    );
            }),
        bottomNavigationBar: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    ),
                    child: addBottomBtn(0, context)),
                flex: 1,
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    ),
                    child: addBottomBtn(1, context)),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget addBottomBtn(int index, BuildContext context) {
  Widget destination;
  String name;
  if (index == 0) {
    name = "Create & Compare";
    destination = CreateVersusCustomizedPage();
  } else {
    name = "Search & Compare";
    destination = CreateVersusBySearchPage();
  }
  return MaterialButton(
    height: 50,
    onPressed: () {
      Navigator.push(context, SlideleftRoute(page: destination));
    },
    color: MyColor.primaryColor(),
    textColor: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        Icon(
          Icons.add,
          color: Colors.white,
        ),
      ],
    ),
  );
}

class CustomAppBarHome extends StatelessWidget implements PreferredSizeWidget {
  final _height = 120.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: MyColor.creamyColor(),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
        ),
        margin: EdgeInsets.only(bottom: 10.0),
        height: _height,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu),
                      color: MyColor.secondColor(),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: MyColor.secondColor()),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 7,
                      child: TextField(
                          decoration: TextFieldBorder(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                      )),
                    ),
                    Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: Icon(
                            Icons.filter_list,
                            color: MyColor.secondColor(),
                          ),
                          onPressed: null,
                          iconSize: 25,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, _height);
}

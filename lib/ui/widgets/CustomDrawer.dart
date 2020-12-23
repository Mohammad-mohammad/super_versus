import 'package:decidable/ui/shared/SlideLeftRoute.dart';
import 'package:decidable/ui/views/loginPage.dart';
import 'package:decidable/ui/views/registerPage.dart';
import 'package:decidable/ui/widgets/avatar.dart';
import 'package:decidable/ui/shared/myColor.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: MyColor.primaryColor(),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: MyColor.secondColor(),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Avatar(radius: 30, url: 'https://www.woolha.com/media/2020/03/eevee.png',),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Doe",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text(
                        "San Francisco, CA",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(              
              leading: Icon(Icons.person, color: Colors.white),
              title: Text('PROFILE', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(              
              leading: Icon(Icons.notifications, color: Colors.white),
              title: Text('NOTIFICATIONS', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(              
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text('SETTINGS', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(              
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text('LOGOUT', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(              
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text('REGISTER', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, SlideleftRoute(page: RegisterPage()));
              },
            ),
            ListTile(              
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text('LOGIN', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, SlideleftRoute(page: LoginPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

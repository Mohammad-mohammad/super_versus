import 'package:decidable/ui/shared/myColor.dart';
import 'package:flutter/material.dart';

const avatarRadius=20.0;
const avatarOverlay=avatarRadius+15;

class VersusMainItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
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
      height: 125,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("item x vs item y item x vs item............",
                  style: TextStyle(color: MyColor.secondColor(), fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                      ), 
                      // Positioned(child: Avatar(avatarRadius), left: avatarOverlay*3,),
                      // Positioned(child: Avatar(avatarRadius), left: avatarOverlay*2,),
                      // Positioned(child: Avatar(avatarRadius), left: avatarOverlay,), 
                      // Positioned(child: Avatar(avatarRadius),), 
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.more_vert),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.favorite_border),
                      Icon(Icons.lock_open)
                    ],
                  ),
                  Text("By Someone",style: TextStyle(color: MyColor.primaryColor(), fontSize: 11, fontWeight: FontWeight.normal),),
                  Text("2019/02/01",style: TextStyle(color: MyColor.primaryColor(), fontSize: 11, fontWeight: FontWeight.normal),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

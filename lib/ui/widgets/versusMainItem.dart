import 'package:decidable/core/models/verse.dart';
import 'package:decidable/ui/widgets/avatar.dart';
import 'package:decidable/ui/shared/myColor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const avatarRadius = 20.0;
const avatarOverlay = avatarRadius + 15;

double screenWidth;
double leftContentWidth;

class VersusMainItem extends StatelessWidget {
  final Verse verse;
  final double rightContentWidth = 25;
  final double marginSize = 5;
  final double paddingSize = 10;

  VersusMainItem({this.verse});

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    leftContentWidth =
        screenWidth - (marginSize + paddingSize) * 2 - rightContentWidth;

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
      padding: EdgeInsets.all(paddingSize),
      margin: EdgeInsets.all(marginSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: leftContentWidth,
            //color: Colors.yellow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  verse.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: MyColor.secondColor(),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                avatarList(verse.imageUrls),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      verse.userName,
                      style: TextStyle(
                          color: MyColor.primaryColor(),
                          fontSize: 11,
                          fontWeight: FontWeight.normal),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        DateFormat.yMMMMEEEEd().format(verse.date),
                        style: TextStyle(
                            color: MyColor.primaryColor(),
                            fontSize: 11,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: rightContentWidth,
            //color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                    padding: EdgeInsets.zero),
                Icon(
                  verse.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: MyColor.primaryColor(),
                ),
                Icon(
                  verse.isPrivate ? Icons.lock : Icons.lock_open,
                  color: MyColor.primaryColor(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget avatarList(List<String> imgUrls) {
  List<Widget> list = new List<Widget>();
  for (var i = 0; i < imgUrls.length; i++) {
    if ((imgUrls.length - i - 1) == 0) {
      list.add(Positioned(
        child: Avatar(radius: avatarRadius, url: imgUrls[i]),
      ));
    } else {
      list.add(Positioned(
        child: Avatar(radius: avatarRadius, url: imgUrls[i]),
        left: avatarOverlay * (imgUrls.length - i - 1),
      ));
    }
  }
  return Stack(
    children: [
      Container(
        width: double.infinity,
      ),
      ...list,
    ],
  );
}

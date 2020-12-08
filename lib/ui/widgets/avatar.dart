import 'package:decidable/ui/shared/myColor.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double radius;
  final String url;
  Avatar({this.radius, this.url});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius+3,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: radius,
        backgroundImage:
            NetworkImage(url),
        backgroundColor: MyColor.creamyColor(),
      ),
    );
  }
}
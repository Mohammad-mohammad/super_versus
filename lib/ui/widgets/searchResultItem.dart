import 'package:decidable/core/models/product.dart';
import 'package:decidable/ui/widgets/avatar.dart';
import 'package:decidable/ui/shared/myColor.dart';
import 'package:flutter/material.dart';

class SearchResultItem extends StatelessWidget {
  final Product product;
  final Function function;
  final String query;

  SearchResultItem({this.product, this.function, this.query});

  Widget getTitle() {
    String normalPart1 = "";
    String oldPart = "";
    String normalPart2 = "";

    String string = product.name;
    int qIndexStart = string.toLowerCase().indexOf(query.toLowerCase());
    int qIndexEnd = qIndexStart + query.length;
    if (qIndexStart == -1) {
      return Text(
        product.name,
        overflow: TextOverflow.clip,
      );
    } else {
      normalPart1 = string.substring(0, qIndexStart);
      oldPart = string.substring(qIndexStart, qIndexEnd);
      normalPart2 = string.substring(qIndexEnd);
      return RichText(
        overflow: TextOverflow.clip,
        text: TextSpan(
          children: [
            TextSpan(
              text: normalPart1,
              style:
                  TextStyle(fontWeight: FontWeight.normal, color: Colors.grey),
            ),
            TextSpan(
              text: oldPart,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            TextSpan(
              text: normalPart2,
              style:
                  TextStyle(fontWeight: FontWeight.normal, color: Colors.grey),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Avatar(
                  radius: 30,
                  url: 'https://www.woolha.com/media/2020/03/eevee.png',
                ),
                Container(
                  child: getTitle(),
                  padding: EdgeInsets.only(left: 10),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add_circle_outline,
            ),
            color: MyColor.primaryColor(),
            onPressed: function,
          ),
        ],
      ),
    );
  }
}

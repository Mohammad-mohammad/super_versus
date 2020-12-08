import 'package:decidable/core/models/product.dart';
import 'package:decidable/ui/widgets/avatar.dart';
import 'package:decidable/ui/shared/myColor.dart';
import 'package:flutter/material.dart';

class SearchResultItem extends StatelessWidget {
  final Product product;
  final Function function;
  SearchResultItem({this.product, this.function});

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
                Avatar(radius: 30, url: 'https://www.woolha.com/media/2020/03/eevee.png',),
                Container(
                  child: Text(product.name, overflow: TextOverflow.clip,),
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

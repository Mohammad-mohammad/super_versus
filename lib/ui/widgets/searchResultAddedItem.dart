import 'package:decidable/core/models/product.dart';
import 'package:decidable/ui/widgets/avatar.dart';
import 'package:decidable/ui/shared/myColor.dart';
import 'package:flutter/material.dart';

class SearchResultAddedItem extends StatelessWidget {
  final Product product;
  final Function function;

  SearchResultAddedItem({this.product, this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColor.primaryColorOp(0.3),
      padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Avatar(radius: 30, url: 'https://www.woolha.com/media/2020/03/eevee.png',),
                Container(
                  child: Text(product.name),
                  padding: EdgeInsets.only(left: 10),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
            ),
            color: Colors.red,
            onPressed: function,
          ),
        ],
      ),
    );
  }
}

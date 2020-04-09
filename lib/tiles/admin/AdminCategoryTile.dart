import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Screens/category_screen.dart';
import 'package:ecommerce/helper/categoryList.dart';
import 'package:flutter/material.dart';

class AdminCategoryTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  AdminCategoryTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          elevation: 4,
          child: ListTile(
            title: Text(snapshot.data["title"]),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

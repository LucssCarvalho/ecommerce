import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/helper/iconList.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CategoryTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        child: Icon(
          iconList[snapshot.data["title"]],
          size: 20,
          color: Colors.amber[800],
        ),
      ),
      title: Text(snapshot.data["title"]),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CategoryScreen(
              snapshot,
            ),
          ),
        );
      },
    );
  }
}

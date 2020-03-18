import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Screens/category_screen.dart';
import 'package:ecommerce/helper/categoryList.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CategoryTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageCategoryList[snapshot.data["title"]],
              fit: BoxFit.cover),
        ),
        child: ListTile(
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
        ),
      ),
    );
  }
}

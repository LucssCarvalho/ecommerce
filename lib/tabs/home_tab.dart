import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/tiles/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Widget _buildBodyBack() => Container(
        decoration: BoxDecoration(color: Colors.white
            // gradient: LinearGradient(
            //     colors: [Colors.cyan, Colors.cyan[900]],
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight),
            ),
      );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("products").getDocuments(),
      builder: (context, snapshop) {
        if (!snapshop.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
            children: snapshop.data.documents.map((doc) {
              return CategoryTile(doc);
            }).toList(),
          );
        }
      },
    );
  }
}

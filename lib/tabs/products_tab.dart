import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/tiles/categort_tile.dart';
import 'package:flutter/material.dart';

class ProductsTab extends StatelessWidget {
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
          var dividedTiles = ListTile.divideTiles(
                  tiles: snapshop.data.documents.map((doc) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CategoryTile(doc),
                    );
                  }).toList(),
                  color: Colors.grey[500])
              .toList();

          return ListView(children: dividedTiles);
        }
      },
    );
  }
}

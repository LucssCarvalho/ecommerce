import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/tiles/admin/AdminCategoryTile.dart';
import 'package:flutter/material.dart';

class AdminCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Controle de categorias',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("products").getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );

          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return AdminCategoryTile(snapshot.data.documents[index]);
            },
          );
        },
      ),
    );
  }
}

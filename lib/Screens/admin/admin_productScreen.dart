import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/tiles/admin/AdminCategoryTile.dart';
import 'package:flutter/material.dart';

class AdminProductScreen extends StatefulWidget {
  @override
  _AdminProductScreenState createState() => _AdminProductScreenState();
}

class _AdminProductScreenState extends State<AdminProductScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> _category = ['A', 'B', 'C', 'D']; // Option 2
    String _selectedCategory; // Option 2

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Controle de produtos',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            DropdownButton(
              hint: Text('Selecione a categoria'), // Not necessary for Option 1
              value: _selectedCategory,
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue;
                });
              },
              items: _category.map((location) {
                return DropdownMenuItem(
                  child: new Text(location),
                  value: location,
                );
              }).toList(),
            ),
            Expanded(
              child: FutureBuilder<QuerySnapshot>(
                future:
                    Firestore.instance.collection("products").getDocuments(),
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
            ),
          ],
        ));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Screens/admin/admin_editProductScreen.dart';
import 'package:ecommerce/Screens/category_screen.dart';
import 'package:ecommerce/Screens/product_screen.dart';
import 'package:ecommerce/helper/categoryList.dart';
import 'package:ecommerce/tiles/category_tile.dart';
import 'package:flutter/material.dart';

class AdminCategoryTile extends StatelessWidget {
  final DocumentSnapshot category;

  AdminCategoryTile(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        elevation: 4,
        child: ExpansionTile(
          title: Text(
            category.data["title"],
            style: TextStyle(color: Colors.grey[850]),
          ),
          children: <Widget>[
            FutureBuilder<QuerySnapshot>(
              future: category.reference.collection("items").getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Container();
                else
                  return Column(
                    children: snapshot.data.documents.map(
                      (doc) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                NetworkImage(doc.data['images'][0]),
                          ),
                          title: Text(
                            doc.data["title"],
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: Text(
                              "R\$: ${doc.data["price"].toStringAsFixed(2)}"),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditProductScreen(category.documentID, doc),
                              ),
                            );
                          },
                        );
                      },
                    ).toList()
                      ..add(
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.add,
                              color: Colors.blue,
                            ),
                          ),
                          title: Text('Adicionar'),
                          onTap: () {
                            // Navigator.of(context).push(
                            //   // MaterialPageRoute(
                            //   //   builder: (context) =>
                            //   //       EditProductScreen(category.documentID),
                            //   // ),
                            // );
                          },
                        ),
                      ),
                  );
              },
            )
          ],
        ),
      ),
    );
  }
}

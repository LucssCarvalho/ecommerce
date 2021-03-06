import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/modal/product_modal.dart';
import 'package:ecommerce/tiles/productTile.dart';
import 'package:ecommerce/widgets/cart_button.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  const CategoryScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: CartButton(),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            )
          ],
          title: Text(
            snapshot.data['title'],
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.grid_on,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.list,
                ),
              ),
            ],
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance
              .collection("products")
              .document(snapshot.documentID)
              .collection("items")
              .getDocuments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return TabBarView(
                // physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  GridView.builder(
                    padding: EdgeInsets.all(4.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        childAspectRatio: 0.65),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      ProductModal data = ProductModal.fromDocument(
                          snapshot.data.documents[index]);
                      data.category = this.snapshot.documentID;
                      return ProductTile("grid", data);
                    },
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(4.0),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      ProductModal data = ProductModal.fromDocument(
                          snapshot.data.documents[index]);
                      data.category = this.snapshot.documentID;

                      return ProductTile("list", data);
                    },
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

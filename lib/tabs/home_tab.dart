import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/modal/user_modal.dart';
import 'package:ecommerce/tiles/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scoped_model/scoped_model.dart';

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
<<<<<<< Updated upstream
    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            FutureBuilder<QuerySnapshot>(
              future: Firestore.instance.collection("products").getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SliverToBoxAdapter(
                    child: Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                } else {
                  return SliverList(
                    delegate: SliverChildListDelegate(
                      snapshot.data.documents.map((doc) {
                        return CategoryTile(doc);
                      }).toList(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ],
=======
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("products").getDocuments(),
      builder: (context, snapshop) {
        if (!snapshop.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ScopedModelDescendant<UserModel>(
            builder: (context, child, model) {
              return Column(
                children: <Widget>[
                  !model.isLoggedIn()
                      ? Row(
                          children: <Widget>[],
                        )
                      : Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Saldo disponível: ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.cyan[600]),
                                        ),
                                        Text(
                                          'R\$:280,00',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.cyan[800],
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                  Expanded(
                    child: ListView(
                      children: snapshop.data.documents.map((doc) {
                        return CategoryTile(doc);
                      }).toList(),
                    ),
                  ),
                ],
              );
            },
          );
        }
      },
>>>>>>> Stashed changes
    );
  }
}

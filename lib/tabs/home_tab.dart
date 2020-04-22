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
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        return FutureBuilder<QuerySnapshot>(
          future: Firestore.instance.collection("products").getDocuments(),
          builder: (context, snapshop) {
            if (!snapshop.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: <Widget>[
                  // !model.isLogged()
                  //     ? Row(
                  //         children: <Widget>[],
                  //       )
                  //     : Container(
                  //         padding: EdgeInsets.all(15),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: <Widget>[
                  //             Text(
                  //               'olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}',
                  //               style: TextStyle(
                  //                   fontWeight: FontWeight.w500, fontSize: 20),
                  //             ),
                  //             Container(
                  //               padding: EdgeInsets.only(top: 8),
                  //               child: Row(
                  //                 children: <Widget>[
                  //                   Text(
                  //                     'Saldo disponível:',
                  //                     style: TextStyle(
                  //                         fontSize: 18, color: Colors.blue),
                  //                   ),
                  //                   Text(
                  //                     'R\$: ${model.userData["value"].toStringAsFixed(2)}',
                  //                     style: TextStyle(
                  //                         fontWeight: FontWeight.w500,
                  //                         fontSize: 20,
                  //                         color: Colors.blue[600]),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  Expanded(
                    child: ListView(
                      children: snapshop.data.documents.map((doc) {
                        return CategoryTile(doc);
                      }).toList(),
                    ),
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }
}

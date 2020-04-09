import 'package:ecommerce/widgets/adminOption_button.dart';
import 'package:flutter/material.dart';

class AdminTab extends StatefulWidget {
  @override
  _AdminTabState createState() => _AdminTabState();
}

class _AdminTabState extends State<AdminTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AdminOptionButton(
            Icons.supervised_user_circle, "Controle de usuarios", "Users"),
        AdminOptionButton(Icons.list, "Controle de categorias", "category"),
        AdminOptionButton(
            Icons.folder_special, "Controle de produtos", "product"),
        AdminOptionButton(Icons.shopping_cart, "Controle de pedidos", "Users"),
      ],
    );
  }
}

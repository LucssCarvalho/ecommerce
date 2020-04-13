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
            Icons.supervised_user_circle, "Controle de Usuarios", "Users"),
        AdminOptionButton(Icons.list, "Controle de Categorias", "category"),
        AdminOptionButton(
            Icons.folder_special, "Controle de Produtos", "product"),
        AdminOptionButton(Icons.shopping_cart, "Controle de Pedidos", "Users"),
        AdminOptionButton(
            Icons.card_giftcard, "Controle de Promoções", "Users"),
        AdminOptionButton(
            Icons.question_answer, "Controle de Dúvidas", "Users"),
        AdminOptionButton(
            Icons.insert_drive_file, "Controle do Termo de Serviço", "Users"),
      ],
    );
  }
}

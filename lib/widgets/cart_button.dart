import 'package:ecommerce/Screens/cart_screen.dart';
import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue[800],
      child: Icon(
        Icons.shopping_cart,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CartScreen()));
      },
    );
  }
}

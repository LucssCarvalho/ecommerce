import 'package:ecommerce/Screens/cart_screen.dart';
import 'package:ecommerce/modal/cart_modal.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue[800],
      child: Container(
        alignment: Alignment.center,
        child: ScopedModelDescendant<CartModel>(
          builder: (context, child, model) {
            int quantProducts = model.products.length;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                quantProducts != 0 ? Text(quantProducts.toString()) : Text(''),
                Icon(Icons.shopping_cart)
              ],
            );
          },
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CartScreen(),
          ),
        );
      },
    );
  }
}

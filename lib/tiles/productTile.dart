import 'package:ecommerce/modal/product_modal.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final String type;
  final ProductModal product;

  ProductTile(this.type, this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 0.9,
              child: Image.network(
                product.images[1],
                fit: BoxFit.cover,
              ),
            ),
            Text(product.title),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'preço: R\$ ${product.price.toString()}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

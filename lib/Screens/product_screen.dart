import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce/modal/product_modal.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final ProductModal product;

  ProductScreen(this.product);
  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductModal product;
  String color;

  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.3,
            child: Carousel(
              images: product.images.map(
                (url) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(url), fit: BoxFit.contain),
                    ),
                  );
                },
              ).toList(),
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              dotColor: Colors.cyan,
              dotIncreasedColor: Colors.cyanAccent,
              autoplay: false,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  product.title,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
                Text(
                  "R\$ ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: Colors.cyan),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Cor",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 60,
                  child: GridView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.8,
                      ),
                      children: product.colors.map((c) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              color = c;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              border: Border.all(
                                  color: c == color ? Colors.cyan : Colors.grey,
                                  width: 3.0),
                            ),
                            alignment: Alignment.center,
                            child: Text(c),
                          ),
                        );
                      }).toList()),
                ),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                    child: Text(
                      'Adicionar ao carrinho',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    onPressed: color != null ? () {} : null,
                    color: Colors.cyan,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

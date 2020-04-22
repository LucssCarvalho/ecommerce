import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce/Screens/cart_screen.dart';
import 'package:ecommerce/modal/cart_modal.dart';
import 'package:ecommerce/modal/cart_product.dart';
import 'package:ecommerce/modal/product_modal.dart';
import 'package:ecommerce/modal/user_modal.dart';
import 'package:ecommerce/widgets/cart_button.dart';
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
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: CartButton(),
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
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
                dotColor: Colors.blue,
                dotIncreasedColor: Colors.blueAccent,
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
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                    maxLines: 3,
                  ),
                  Text(
                    "R\$ ${product.price.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: Colors.blue),
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
                                    color:
                                        c == color ? Colors.blue : Colors.grey,
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
                        UserModel.of(context).isLoggedIn()
                            ? 'Adicionar ao carrinho'
                            : 'Entre para comprar',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                      onPressed: color != null
                          ? () {
                              if (UserModel.of(context).isLoggedIn()) {
                                CartProduct cartProduct = CartProduct();
                                cartProduct.colors = color;
                                cartProduct.quantity = 1;
                                cartProduct.pid = product.id;
                                cartProduct.category = product.category;

                                _openSnack(context, product);

                                CartModel.of(context).addCartItem(cartProduct);
                              } else {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => CartScreen(),
                                  ),
                                );
                              }
                            }
                          : null,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'Descrição:',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    product.description,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _openSnack(BuildContext context, ProductModal productModal) {
    final snackBar = SnackBar(
        content: Text('Item adicionado ao carrinho ${productModal.title}'));
    _scaffoldKey.currentState.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}

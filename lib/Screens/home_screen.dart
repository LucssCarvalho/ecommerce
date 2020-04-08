import 'package:ecommerce/tabs/home_tab.dart';
import 'package:ecommerce/widgets/cart_button.dart';
import 'package:ecommerce/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          floatingActionButton: CartButton(),
          appBar: AppBar(
            title: Text(
              'Catálogo',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            actions: <Widget>[
              // IconButton(
              //   icon: Icon(Icons.shopping_cart),
              //   onPressed: () {},
              // )
            ],
          ),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Produtos',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: HomeTab(),
        ),
        Container(
          color: Colors.blue,
        ),
      ],
    );
  }
}

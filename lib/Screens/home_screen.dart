import 'package:ecommerce/Screens/cart_screen.dart';
import 'package:ecommerce/tabs/admin_tab.dart';
import 'package:ecommerce/tabs/home_tab.dart';
import 'package:ecommerce/tabs/question_tab.dart';
import 'package:ecommerce/tabs/settings_tab.dart';
import 'package:ecommerce/tabs/term_of_use.dart';
import 'package:ecommerce/tabs/wallet_tab.dart';
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
          ),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Carteira',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: WalletTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Meus Pedidos',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: HomeTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Meus Pedidos',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: HomeTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Opções de Administrador',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: AdminTab(),
        ),
        Scaffold(
          body: QuestionTab(),
          appBar: AppBar(
            title: Text(
              'Perguntas Frequentes',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          body: SettingsTab(),
          appBar: AppBar(
            title: Text(
              'Configurações',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          body: TermOfUseTab(),
          appBar: AppBar(
            title: Text(
              'Termo de Serviço',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}

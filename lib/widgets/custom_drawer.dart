import 'package:ecommerce/Screens/home_screen.dart';
import 'package:ecommerce/Screens/login_screen.dart';
import 'package:ecommerce/modal/user_modal.dart';
import 'package:ecommerce/tiles/drawerTile.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  Widget _buildDrawerBack() => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          // _buildDrawerBack(),
          ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    color: Colors.blueGrey[50],
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.fromLTRB(30.0, 30, 18, 0),
                    height: 170,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 20,
                          left: 0,
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/logo_sacola.png'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Sacola 111',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 0.0,
                          bottom: 0.0,
                          child: ScopedModelDescendant<UserModel>(
                            builder: (context, child, model) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      !model.isLoggedIn()
                                          ? 'Entre ou cadastre-se'
                                          : "Sair",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onTap: () {
                                      if (!model.isLoggedIn())
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => LoginScreen(),
                                          ),
                                        );
                                      else
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => HomeScreen(),
                                          ),
                                        );
                                      model.signOut();
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ScopedModelDescendant<UserModel>(
                  builder: (context, child, model) {
                return Column(
                  children: <Widget>[
                    DrawerTile(Icons.home, "Início", pageController, 0),
                    model.isLoggedIn() == true
                        ? DrawerTile(
                            Icons.account_balance_wallet,
                            "Carteira: R\$: ${model.userData['value'].toStringAsFixed(2)}",
                            pageController,
                            1)
                        : Row(
                            children: <Widget>[],
                          ),
                    model.isLoggedIn() == true
                        ? DrawerTile(Icons.playlist_add_check, "Meus Pedidos",
                            pageController, 2)
                        : Row(
                            children: <Widget>[],
                          ),
                    model.isLoggedIn() == true
                        ? DrawerTile(Icons.card_giftcard, "Aplicar Promoção",
                            pageController, 3)
                        : Row(
                            children: <Widget>[],
                          ),
                    model.userData["userAdmin"] == true
                        ? DrawerTile(Icons.supervised_user_circle,
                            "Opções de Administrador", pageController, 4)
                        : Row(
                            children: <Widget>[],
                          ),
                    DrawerTile(Icons.question_answer, "Perguntas Frequentes",
                        pageController, 5),
                    Divider(),
                    model.isLoggedIn() == true
                        ? DrawerTile(
                            Icons.settings, "Configurações", pageController, 6)
                        : Row(
                            children: <Widget>[],
                          ),
                    model.isLoggedIn() == true
                        ? DrawerTile(Icons.insert_drive_file,
                            "Termo de Serviço", pageController, 7)
                        : Row(
                            children: <Widget>[],
                          ),
                  ],
                );
              }),
            ],
          )
        ],
      ),
    );
  }
}

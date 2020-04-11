import 'package:ecommerce/Screens/recoverPass.dart';
import 'package:ecommerce/Screens/signup_screen.dart';
import 'package:ecommerce/modal/user_modal.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text(
              'CRIAR CONTA',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => SignUpScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/background/signUp_wallpaper.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading)
              return Center(
                child: CircularProgressIndicator(),
              );

            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  // Container(
                  //   margin: EdgeInsets.all(15),
                  //   child: CircleAvatar(
                  //     radius: 70,
                  //     child: Icon(
                  //       Icons.person,
                  //       size: 80,
                  //     ),
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/logo_sacola.png'),
                                ),
                              ),
                            ),
                            Text(
                              'SACOLA 111',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.blue[800],
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'E-mail*',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),
                      validator: (text) {
                        if (text.isEmpty || !text.contains('@'))
                          return "E-mail inválido";
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: _passController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Senha*',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                      ),
                      validator: (text) {
                        if (text.isEmpty || text.length < 6)
                          return 'Senha inválida';
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        child: Text(
                          'esqueci minha senha',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RecoverPassScreen(),
                            ),
                          );
                        },
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'ENTRAR',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      color: Colors.blue[600],
                      onPressed: () {
                        model.signIn(
                            email: _emailController.text,
                            pass: _passController.text,
                            onSucess: _onSucess,
                            onFail: _onFail);
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100,
                        child: Divider(
                          color: Colors.white,
                          height: 50,
                        ),
                      ),
                      Text(
                        " OU ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        width: 100,
                        child: Divider(
                          color: Colors.white,
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: Colors.blue[900],
                          child: Text(
                            'Facebook',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: Colors.red,
                          child: Text(
                            'Google',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onSucess() {
    Navigator.of(context).pop();
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          'Falha ao entrar',
        ),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ),
    );
  }
}

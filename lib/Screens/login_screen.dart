import 'package:ecommerce/Screens/signup_screen.dart';
import 'package:ecommerce/modal/user_modal.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ScopedModelDescendant<UserModel>(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: 'E-mail'),
                    validator: (text) {
                      if (text.isEmpty || !text.contains('@'))
                        return "E-mail inválido";
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Senha'),
                    validator: (text) {
                      if (text.isEmpty || text.length < 6)
                        return 'Senha inválida';
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    child: Text(
                      'esqueci minha senha',
                      style: TextStyle(color: Colors.cyan[300]),
                    ),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
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
                    color: Colors.cyan[600],
                    onPressed: () {
                      //   if (_formKey.currentState.validate()) {}

                      // },
                      model.signIn();
                    }),
              ],
            ),
          );
        },
      ),
    );
  }
}

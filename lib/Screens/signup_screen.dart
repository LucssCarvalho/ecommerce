import 'package:ecommerce/modal/user_modal.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _adressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Criar Conta',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
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
                    controller: _nameController,
                    decoration: InputDecoration(hintText: 'Nome Completo*'),
                    validator: (text) {
                      if (text.isEmpty || text.length < 5)
                        return 'Nome inválido';
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: 'E-mail*'),
                    validator: (text) {
                      if (text.isEmpty || !text.contains('@'))
                        return "E-mail inválido";
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _passController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Senha*'),
                    validator: (text) {
                      if (text.isEmpty || text.length < 6)
                        return 'Senha inválida';
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _adressController,
                    decoration: InputDecoration(hintText: 'Endereço*'),
                    validator: (text) {
                      if (text.isEmpty || text.length < 6)
                        return 'Endereço invalido';
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'CADASTRAR',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  color: Colors.cyan[600],
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Map<String, dynamic> userData = {
                        "name": _nameController.text,
                        "email": _emailController.text,
                        "adress": _adressController.text
                      };

                      model.signUp(
                          userData: userData,
                          pass: _passController.text,
                          onSucess: _onSucess,
                          onFail: _onFail);
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onSucess() {}

  void _onFail() {}
}

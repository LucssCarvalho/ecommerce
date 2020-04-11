import 'package:ecommerce/modal/user_modal.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class RecoverPassScreen extends StatefulWidget {
  @override
  _RecoverPassScreenState createState() => _RecoverPassScreenState();
}

class _RecoverPassScreenState extends State<RecoverPassScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Recuperar senha',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[],
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
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/recover_pass.png'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email*',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.black,
                        ),
                      ),
                      validator: (text) {
                        if (text.isEmpty || !text.contains('@'))
                          return "E-mail inválido";
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
                        'RECUPERAR',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    color: Colors.blue[600],
                    onPressed: () {
                      if (_emailController.text.isEmpty)
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Insira seu e-mail para recuperação"),
                            backgroundColor: Colors.redAccent,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      else {
                        model.recoverPass(_emailController.text);
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content: Text(
                                "Te encaminhamos um e-mail, confira sua caixa de entrada!"),
                            backgroundColor: Colors.blue[600],
                            duration: Duration(seconds: 5),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

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
        color: Colors.blue[900],
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
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/icons/recover_pass.png'),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Quer acessar a loja mas esqueceu a senha do seu cadastro ? \n\nDigite agora seu e-mail, que iremos te ajudar a recupera-la.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
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
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                    color: Colors.white,
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

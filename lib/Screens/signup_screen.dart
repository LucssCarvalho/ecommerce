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
  final _userDocumentController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Criar Conta',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blue[900],
        child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading)
              return Center(
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    )),
              );
            return Column(
              children: <Widget>[
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      padding: EdgeInsets.all(16.0),
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(15),
                          child: CircleAvatar(
                            backgroundColor: Colors.blue[500],
                            radius: 70,
                            child: Icon(
                              Icons.person_add,
                              color: Colors.white,
                              size: 80,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: 'Nome completo*',
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
                              if (text.isEmpty || text.length < 5)
                                return 'Nome inválido';
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _userDocumentController,
                            decoration: InputDecoration(
                              hintText: 'CPF*',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.insert_drive_file,
                                color: Colors.black,
                              ),
                            ),
                            validator: (text) {
                              if (text.isEmpty || text.length < 11)
                                return 'CPF invalido';
                            },
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
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
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'CADASTRAR',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          color: Colors.white,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Map<String, dynamic> userData = {
                                "name": _nameController.text,
                                "email": _emailController.text,
                                "userDocument": _userDocumentController.text,
                                "userAdmin": false,
                                "value": 0
                              };

                              model.signUp(
                                  userData: userData,
                                  pass: _passController.text,
                                  onSucess: _onSucess,
                                  onFail: _onFail);
                            }
                          },
                        ),
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
                                color: Colors.blue,
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
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onSucess() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          'Usuário criado com sucesso!',
        ),
        backgroundColor: Colors.blue[600],
        duration: Duration(seconds: 2),
      ),
    );
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          'Falha ao criar usuário',
        ),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ),
    );
  }
}

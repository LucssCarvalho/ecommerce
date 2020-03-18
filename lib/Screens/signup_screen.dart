import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Nome Completo*'),
                validator: (text) {
                  if (text.isEmpty || text.length < 5) return 'Nome inválido';
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
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
                obscureText: true,
                decoration: InputDecoration(hintText: 'Senha*'),
                validator: (text) {
                  if (text.isEmpty || text.length < 6) return 'Senha inválida';
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
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
                if (_formKey.currentState.validate()) {}
              },
            ),
          ],
        ),
      ),
    );
  }
}

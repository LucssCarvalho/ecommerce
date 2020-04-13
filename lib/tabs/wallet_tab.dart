import 'package:ecommerce/modal/user_modal.dart';
import 'package:ecommerce/helper/extension/intExtension.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class WalletTab extends StatefulWidget {
  @override
  _WalletTabState createState() => _WalletTabState();
}

class _WalletTabState extends State<WalletTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 150,
          color: Colors.cyan,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Saldo Disponível',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'R\$: ${UserModel.of(context).userData["value"].toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

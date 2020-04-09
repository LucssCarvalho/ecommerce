import 'package:ecommerce/Screens/admin/admin_categoryScreen.dart';
import 'package:ecommerce/Screens/admin/admin_productScreen.dart';
import 'package:ecommerce/Screens/home_screen.dart';
import 'package:flutter/material.dart';

class AdminOptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;

  AdminOptionButton(this.icon, this.label, this.route);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          size: 35,
        ),
        onTap: () {
          _navigator(context, route);
        },
        title: Text(
          label,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

_navigator(context, String route) {
  switch (route) {
    case "home":
      {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }
      break;

    case "category":
      {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AdminCategoryScreen(),
          ),
        );
      }
      break;

    case "product":
      {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AdminProductScreen(),
          ),
        );
      }
      break;
  }
}

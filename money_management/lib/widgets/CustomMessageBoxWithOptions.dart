import 'package:flutter/material.dart';

import '../screens/ListOfExpensesScreen.dart';
import '../widgets/CustomBottomNavigationBar.dart';

class CustomMessageBoxWithOptions extends StatelessWidget {
  final String title;
  final String message;

  CustomMessageBoxWithOptions({this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: Colors.white.withAlpha(175),
      title: Center(
        child: Text(
          this.title,
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Center(
              child: Text(
                this.message,
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'Ok',
            style: TextStyle(fontSize: 20, color: Colors.indigoAccent),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(
            'Go back',
            style: TextStyle(fontSize: 20, color: Colors.indigoAccent),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ListOfExpensesScreen(
                  CustomBottomNavigationBar(selectedOption: 2),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

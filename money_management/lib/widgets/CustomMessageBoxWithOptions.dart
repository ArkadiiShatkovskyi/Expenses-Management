import 'package:flutter/material.dart';

import '../screens/ListOfExpensesScreen.dart';
import '../widgets/CustomBottomNavigationBar.dart';

class CustomMessageBoxWithOptions extends StatelessWidget {
  final String title;
  final String message;

  CustomMessageBoxWithOptions({ required this.title, required this.message});

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
          style: Theme.of(context).primaryTextTheme.displayMedium,
        ),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Center(
              child: Text(
                this.message,
                style: Theme.of(context).primaryTextTheme.displaySmall,
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'Ok',
            style: Theme.of(context).primaryTextTheme.displayMedium,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(
            'Go back',
            style: Theme.of(context).primaryTextTheme.displayMedium,
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

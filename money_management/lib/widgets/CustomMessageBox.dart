import 'package:flutter/material.dart';

class CustomMessageBox extends StatelessWidget {
  final String title;
  final String message;

  CustomMessageBox({this.title, this.message});

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
          style: Theme.of(context).primaryTextTheme.displaySmall,
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
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        //backgroundColor: MaterialStateProperty.all(Colors.indigoAccent.withAlpha(125)),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shadowColor: MaterialStateProperty.all(
          Colors.indigoAccent,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.black.withAlpha(100)),
          ),
        ),
      ),
      onPressed: this.onPressed,
      icon: Icon(
        this.icon,
        //color: Colors.black.withAlpha(220),
        color: Colors.white.withAlpha(220),
      ),
      label: Text(
        this.text,
        style: Theme.of(context).primaryTextTheme.displaySmall,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  CustomButton({this.text, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        //backgroundColor: MaterialStateProperty.all(Colors.indigoAccent.withAlpha(125)),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.black.withAlpha(190)),
          ),
        ),
      ),
      onPressed: this.onPressed,
      icon: Icon(
        this.icon,
        color: Colors.black.withAlpha(190),
      ),
      label: Text(
        this.text,
        style: TextStyle(
          color: Colors.black.withAlpha(190),
          fontSize: 17,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final double width;
  final double height;
  final String text;

  CustomAppBar({this.width, this.height, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      child: Center(
        child: Text(
          this.text,
          style: TextStyle(
            color: Colors.black.withAlpha(175),
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}

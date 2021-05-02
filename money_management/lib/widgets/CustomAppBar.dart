import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  double width;
  double height;

  CustomAppBar({this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      child: Center(
        child: Text(
          "Summary screen",
          style: TextStyle(
            color: Colors.black.withAlpha(175),
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  double width;
  double height;
  Widget child;

  CustomContainer({this.width, this.height, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
      decoration: BoxDecoration(
        color: Colors.transparent.withAlpha(25),
        borderRadius: BorderRadius.circular(30),
      ),
      child: this.child,
    );
  }
}

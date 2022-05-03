import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;

  CustomContainer({this.width, this.height, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 11), // changes position of shadow
          ),
        ],
        // color: Colors.transparent.withAlpha(25),
        color: Colors.indigoAccent.withAlpha(175),
        borderRadius: BorderRadius.circular(30),
      ),
      child: this.child,
    );
  }
}

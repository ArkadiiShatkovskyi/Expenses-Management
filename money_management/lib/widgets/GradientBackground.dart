import 'package:flutter/material.dart';

class GradientBackGround extends StatelessWidget {
  final Widget child;

  GradientBackGround({ required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.0,
              0.5,
              0.7,
              0.8,
            ],
            colors: [
              Colors.lightGreenAccent.withAlpha(70),
              Colors.cyanAccent.withAlpha(70),
              Colors.lightBlue.withAlpha(70),
              Colors.blue.withAlpha(70),
              //Colors.blueGrey,
            ],
          ),
        ),
        child: Center(
          child: this.child,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './screens/SummaryScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money management app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                Colors.lightGreenAccent.withAlpha(150),
                Colors.cyanAccent.withAlpha(150),
                Colors.lightBlue.withAlpha(150),
                Colors.blue.withAlpha(150),
                //Colors.blueGrey,
              ],
            ),
          ),
          child: SummaryScreen(),
        ),
      ),
    );
  }
}

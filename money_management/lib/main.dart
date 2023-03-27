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
        primaryTextTheme: TextTheme(
          displayMedium: TextStyle(
            color: Colors.black,
            fontSize: 45,
            fontFamily: 'rm-almanack',
          ),
          displayLarge: TextStyle(
            color: Colors.black,
            fontSize: 60,
            fontFamily: 'rm-almanack',
          ),
          displaySmall: TextStyle(
            color: Colors.black,
            fontSize: 37,
            fontFamily: 'rm-almanack',
          ),
        ),
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
          child: SummaryScreen(null),
        ),
      ),
    );
  }
}

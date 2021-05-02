import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/CustomBottomNavigationBar.dart';
import '../widgets/StatisticPieChart.dart';
import '../widgets/DataElements.dart';
import '../widgets/CustomAppBar.dart';

class SummaryScreen extends StatefulWidget {
  SummaryScreen({Key key}) : super(key: key);

  @override
  _SummaryScreen createState() => _SummaryScreen();
}

class _SummaryScreen extends State<SummaryScreen> {
  void onBNBClick(int value) {}

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Map<String, double> dataMap = {
      "Saved": 700,
      "Food": 400,
      "Food delivery": 60,
      "Electronics": 150,
      "Gifts": 100,
    };

    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(1),
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: height * 0.025,
                ),
                CustomAppBar(width: width, height: height * 0.1),
                SizedBox(
                  height: height * 0.025,
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.transparent.withAlpha(25),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: DateElements(
                      height: height,
                      width: width,
                    )),
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent.withAlpha(25),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: StatisticPieChart(
                    dataMap: dataMap,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

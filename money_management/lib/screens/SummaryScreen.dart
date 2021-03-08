import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/AppNavigationBar.dart';
import '../widgets/StatisticPieChart.dart';
import '../widgets/DataElements.dart';

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
      bottomNavigationBar: AppNavigationBar(1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Summary screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: height * 0.05,
            ),
            Container(
                margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.darken,
                  color: Colors.deepPurple.withAlpha(200),
                  border: Border.all(
                    color: Colors.deepPurple.withAlpha(200),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 4,
                      blurRadius: 3,
                      offset: Offset(7.0, 7.0),
                    )
                  ],
                ),
                child: DateElements(height: height, width: width,)),
            SizedBox(
              height: height * 0.04,
            ),
            Container(
              decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.darken,
                color: Colors.deepPurple.withAlpha(200),
                border: Border.all(
                  color: Colors.deepPurple.withAlpha(200),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 4,
                    blurRadius: 3,
                    offset: Offset(7.0, 7.0),
                  )
                ],
              ),
              child: StatisticPieChart(dataMap: dataMap,),
            ),
          ],
        ),
      ),
    );
  }
}

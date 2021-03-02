import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/StatisticPieChart.dart';
import '../widgets/StatisticElement.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        onTap: onBNBClick,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Summary screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(top: height * 0.025, bottom: width * 0.05),
              child: const Text(
                'Statistic',
                style: TextStyle(fontSize: 20),
              ),
            ),
            StatisticElement(elementLabel: "Saved", elementValue: 0.0),
            StatisticElement(elementLabel: "Food", elementValue: 0.0),
            StatisticElement(elementLabel: "Food delivery", elementValue: 0.0),
            StatisticElement(elementLabel: "Electronics", elementValue: 0.0),
            StatisticElement(elementLabel: "Gifts", elementValue: 0.0),
            Padding(
              padding: EdgeInsets.only(top: height * 0.1),
              child: StatisticPieChart(dataMap: dataMap,),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '+',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

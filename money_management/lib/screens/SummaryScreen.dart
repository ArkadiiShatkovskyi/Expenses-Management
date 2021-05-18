import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/DBProvider.dart';
import '../widgets/CustomBottomNavigationBar.dart';
import '../widgets/StatisticPieChart.dart';
import '../widgets/DataElements.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/CustomContainer.dart';
import '../widgets/GradientBackground.dart';

// ignore: must_be_immutable
class SummaryScreen extends StatefulWidget {
  Widget bottomNavigationBar;

  SummaryScreen(this.bottomNavigationBar) {
    if (bottomNavigationBar == null) {
      bottomNavigationBar = CustomBottomNavigationBar(selectedOption: 0);
    }
  }

  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  final DBProvider _dbProvider = DBProvider();

  Map<String, double> dataMap = {
    "Food": 0.0,
    "Electronic": 0.0,
    "Food delivery": 0.0,
    "Clothes": 0.0,
    "Vape": 0.0,
    "Other": 0.0,
  };

  @override
  Widget build(BuildContext context) {
    getData();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: isDataEmpty()
          ? Container(
              height: height,
              width: width,
              child: GradientBackGround(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: height * 0.04,
                    ),
                    CustomAppBar(
                      width: width,
                      height: height * 0.1,
                      text: "Summary screen",
                    ),
                    SizedBox(
                      height: height * 0.3,
                    ),
                    CustomContainer(
                      width: width,
                      height: height,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: const Text(
                          "There is no data. Add new data on another screen.",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.384,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: widget.bottomNavigationBar,
                    ),
                  ],
                ),
              ),
            )
          : Container(
              height: height,
              width: width,
              child: GradientBackGround(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: height * 0.04,
                    ),
                    CustomAppBar(
                      width: width,
                      height: height * 0.1,
                      text: "Summary screen",
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    CustomContainer(
                      width: width,
                      height: height,
                      child: DateElements(
                        height: height,
                        width: width,
                        dataMap: dataMap,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    CustomContainer(
                      width: width,
                      height: height,
                      child: StatisticPieChart(
                        dataMap: dataMap,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.048,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: widget.bottomNavigationBar,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void getData() {
    _dbProvider.expensesByGroup().then((value) {
      setState(() {
        this.dataMap = value;
      });
    });
  }

  bool isDataEmpty() {
    double value = 0.0;
    for (String key in this.dataMap.keys) {
      value += this.dataMap[key];
    }
    return value == 0.0;
  }
}

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
      bottomNavigationBar = CustomBottomNavigationBar(selectedOption: false);
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
/**
    Map<String, double> dataMap = {
      "Food": 700,
      "Electronic": 400,
      "Food delivery": 60,
      "Clothes": 150,
      "Vape": 100,
      "Other": 100,
    };
**/
    return Scaffold(
      body: Container(
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
                height: height * 0.049,
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
}

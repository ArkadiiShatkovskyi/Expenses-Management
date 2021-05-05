import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/CustomBottomNavigationBar.dart';
import '../widgets/StatisticPieChart.dart';
import '../widgets/DataElements.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/CustomContainer.dart';
import '../widgets/GradientBackground.dart';

// ignore: must_be_immutable
class SummaryScreen extends StatelessWidget {
  Widget bottomNavigationBar;

  SummaryScreen(this.bottomNavigationBar) {
    if (bottomNavigationBar == null) {
      bottomNavigationBar = CustomBottomNavigationBar(selectedOption: false);
    }
  }

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
      body: GradientBackGround(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: height * 0.04,
            ),
            CustomAppBar(width: width, height: height * 0.1),
            SizedBox(
              height: height * 0.05,
            ),
            CustomContainer(
                width: width,
                height: height,
                child: DateElements(
                  height: height,
                  width: width,
                )),
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
              height: height * 0.075,
            ),
            bottomNavigationBar,
          ],
        ),
      ),
    );
  }
}

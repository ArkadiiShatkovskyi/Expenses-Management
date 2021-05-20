import 'package:flutter/material.dart';

import '../models/DBProvider.dart';
import '../widgets/DataElements.dart';
import '../widgets/CustomContainer.dart';
import '../widgets/StatisticPieChart.dart';

class SummaryScreenBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SummaryScreenBodyState();
}

class _SummaryScreenBodyState extends State<SummaryScreenBody> {
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
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return isDataEmpty()
        ? SizedBox(
            height: height * 0.789,
            child: ListView(children: [
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
            ]),
          )
        : SizedBox(
            height: height * 0.789,
            child: ListView(
              children: [
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
              ],
            ),
          );
  }

  void getData() {
    _dbProvider.expensesByGroup().then((value) {
      if (mounted) {
        setState(() {
          this.dataMap = value;
        });
      }
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

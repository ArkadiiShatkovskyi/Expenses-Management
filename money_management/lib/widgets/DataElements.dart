import 'package:flutter/material.dart';
import 'StatisticElement.dart';

class DateElements extends StatelessWidget {
  final double height;
  final double width;
  final Map<String, double> dataMap;

  DateElements({this.height, this.width, this.dataMap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: width * 0.05),
          child: Text(
            'Statistic',
            style: Theme.of(context).primaryTextTheme.displayMedium,
          ),
        ),
        for (String item in dataMap.keys) getStatisticElement(item),
        //StatisticElement(elementLabel: "Saved", elementValue: 0.0),
        //StatisticElement(elementLabel: "Food", elementValue: 0.0),
        //StatisticElement(elementLabel: "Food delivery", elementValue: 0.0),
        //StatisticElement(elementLabel: "Electronics", elementValue: 0.0),
        //StatisticElement(elementLabel: "Gifts", elementValue: 0.0),
        SizedBox(height: height * 0.02),
      ],
    );
  }

  Widget getStatisticElement(String keyData) {
    double valueData = 0.0;
    dataMap.forEach((key, value) {
      if (key == keyData) {
        valueData = value;
      }
    });
    return StatisticElement(elementLabel: keyData, elementValue: valueData);
  }
}

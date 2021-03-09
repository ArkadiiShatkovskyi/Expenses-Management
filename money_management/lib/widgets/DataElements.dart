import 'package:flutter/material.dart';
import 'StatisticElement.dart';

class DateElements extends StatelessWidget{

  final double height;
  final double width;

  DateElements({this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
        Container(
          padding: EdgeInsets.only(bottom: width * 0.05),
          child: const Text(
            'Statistic',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
          StatisticElement(elementLabel: "Saved", elementValue: 0.0),
          StatisticElement(elementLabel: "Food", elementValue: 0.0),
          StatisticElement(elementLabel: "Food delivery", elementValue: 0.0),
          StatisticElement(elementLabel: "Electronics", elementValue: 0.0),
          StatisticElement(elementLabel: "Gifts", elementValue: 0.0),
          SizedBox(height: height * 0.02),
        ],
    );
  }

}


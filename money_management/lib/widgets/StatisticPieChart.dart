import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:pie_chart/pie_chart.dart';

class StatisticPieChart extends StatelessWidget {


  final Map<String, double> dataMap;

  const StatisticPieChart({Key key, this.dataMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(width: width * 0.9, height: height * 0.3, child: PieChart(dataMap: dataMap));
  }
}
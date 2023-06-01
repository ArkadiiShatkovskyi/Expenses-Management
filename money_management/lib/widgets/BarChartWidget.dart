import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class BarChartWidget extends StatefulWidget {
  const BarChartWidget({Key? key, required this.points}) : super(key: key);

  final Map points;

  @override
  State<BarChartWidget> createState() =>
      _BarChartWidgetState(points: this.points);
}

class _BarChartWidgetState extends State<BarChartWidget> {
  final Map points;

  _BarChartWidgetState({required this.points});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: BarChart(
        BarChartData(
          barGroups: _chartGroups(),
          borderData: FlBorderData(
              border: const Border(bottom: BorderSide(), left: BorderSide())),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: _bottomTitles),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _chartGroups() {

    List<BarChartGroupData> res = [];
    points.forEach((key, value) {
        res.add(BarChartGroupData(
            x: key.toInt(),
            barRods: [
              BarChartRodData(
                toY: value,
              )
            ]
        ));
      }
      );
      return res;
  }

  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      switch (value.toInt()) {
        case 0:
          text = 'Mn';
          break;
        case 2:
          text = 'Te';
          break;
        case 4:
          text = 'Wd';
          break;
        case 6:
          text = 'Tu';
          break;
        case 8:
          text = 'Fr';
          break;
        case 10:
          text = 'St';
          break;
        case 12:
          text = 'Sn';
          break;
      }
      return Text(text);
    },
  );
}
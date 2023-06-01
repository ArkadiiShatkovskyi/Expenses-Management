import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatisticElement extends StatelessWidget {
  final String elementLabel;
  final double elementValue;

  const StatisticElement({Key? key, required this.elementLabel, required this.elementValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        children: [
          SizedBox(
              width: width * 0.7,
              child: Divider(
                height: height * 0.01,
              )),
          Padding(
            padding: EdgeInsets.only(left: width * 0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.3,
                  child: Text(
                    elementLabel,
                    style: Theme.of(context).primaryTextTheme.displaySmall,
                  ),
                ),
                SizedBox(
                  width: width * 0.3,
                  child: Text(
                    elementValue.toString(),
                    style: Theme.of(context).primaryTextTheme.displaySmall,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

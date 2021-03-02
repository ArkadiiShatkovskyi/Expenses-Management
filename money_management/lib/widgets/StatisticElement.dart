import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatisticElement extends StatelessWidget {
  final String elementLabel;
  final double elementValue;

  const StatisticElement({Key key, this.elementLabel, this.elementValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        children: [
          SizedBox(
              width: width * 0.8,
              child: Divider(
                height: height * 0.02,
                color: Colors.black,
              )),
          Padding(
            padding: EdgeInsets.only(left: width * 0.25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.35,
                  child: Text(
                    elementLabel,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: width * 0.35,
                  child: Text(
                    elementValue.toString(),
                    style: TextStyle(fontSize: 16),
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

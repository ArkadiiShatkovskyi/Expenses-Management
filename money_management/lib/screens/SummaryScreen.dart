import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/CustomBottomNavigationBar.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/GradientBackground.dart';
import '../widgets/SummaryScreenBody.dart';

// ignore: must_be_immutable
class SummaryScreen extends StatelessWidget {
  Widget bottomNavigationBar;

  SummaryScreen(this.bottomNavigationBar) {
    if (bottomNavigationBar == null) {
      bottomNavigationBar = CustomBottomNavigationBar(selectedOption: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                SummaryScreenBody(),
                SizedBox(
                  height: height * 0.0059,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: bottomNavigationBar,
                ),
              ]),
        ),
      ),
    );
  }
}

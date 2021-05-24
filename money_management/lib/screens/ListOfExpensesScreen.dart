import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/ListOfExpenses.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/GradientBackground.dart';

class ListOfExpensesScreen extends StatelessWidget {
  final Widget bottomNavigationBar;

  ListOfExpensesScreen(this.bottomNavigationBar);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: width,
        height: height,
        child: GradientBackGround(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: height * 0.04,
            ),
            CustomAppBar(
              width: width,
              height: height * 0.1,
              text: "List of expenses",
            ),
            ListOfExpense(),
            bottomNavigationBar,
          ]),
        ),
      ),
    );
  }
}

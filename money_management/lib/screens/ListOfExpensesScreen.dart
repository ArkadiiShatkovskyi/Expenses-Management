import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:money_menagment/widgets/ListOfExpenses.dart';

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
          child: ListOfExpense(bottomNavigationBar),
        ),
      ),
    );
  }
}

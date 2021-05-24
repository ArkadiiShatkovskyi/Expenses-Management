import 'package:flutter/material.dart';
import 'package:money_menagment/models/Expense.dart';
import 'package:money_menagment/widgets/EditExpenseDynamicData.dart';

import '../widgets/CustomAppBar.dart';
import '../widgets/GradientBackground.dart';

// ignore: must_be_immutable
class EditExpenseScreen extends StatelessWidget {
  final Widget bottomNavigationBar;
  Expense expense;

  EditExpenseScreen(this.bottomNavigationBar, this.expense);

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
            EditExpenseDynamicData(
                height: height, width: width, expense: expense),
            bottomNavigationBar,
          ]),
        ),
      ),
    );
  }
}

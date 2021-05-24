import 'package:flutter/material.dart';

import '../models/Expense.dart';
import '../widgets/CustomBottomNavigationBar.dart';
import '../widgets/EditExpenseDynamicData.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/GradientBackground.dart';

// ignore: must_be_immutable
class EditExpenseScreen extends StatelessWidget {
  Expense expense;

  EditExpenseScreen(this.expense);

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
              text: "Edit record",
            ),
            EditExpenseDynamicData(
                height: height, width: width, expense: expense),
            SizedBox(
              height: height * 0.31,
            ),
            CustomBottomNavigationBar(selectedOption: 2),
          ]),
        ),
      ),
    );
  }
}

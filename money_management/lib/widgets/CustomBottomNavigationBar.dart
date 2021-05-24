import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../screens/AddExpenseScreen.dart';
import '../screens/SummaryScreen.dart';
import '../screens/ListOfExpensesScreen.dart';

// ignore: must_be_immutable
class CustomBottomNavigationBar extends StatefulWidget {
  int selectedOption;
  CustomBottomNavigationBar({this.selectedOption});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent.withAlpha(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.account_balance_wallet_outlined),
            color: Colors.deepPurple,
            splashColor: Colors.yellow,
            onPressed: widget.selectedOption == 1 || widget.selectedOption == 2
                ? () {
                    widget.selectedOption = 0;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SummaryScreen(this.widget)),
                    );
                  }
                : null,
          ),
          SizedBox(width: 20),
          IconButton(
            icon: const Icon(Icons.add),
            color: Colors.deepPurple,
            splashColor: Colors.yellow,
            onPressed: widget.selectedOption == 0 || widget.selectedOption == 2
                ? () {
                    widget.selectedOption = 1;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddExpense(this.widget)),
                    );
                  }
                : null,
          ),
          SizedBox(width: 20),
          IconButton(
            icon: const Icon(Icons.list),
            color: Colors.deepPurple,
            splashColor: Colors.yellow,
            onPressed: widget.selectedOption == 0 || widget.selectedOption == 1
                ? () {
                    widget.selectedOption = 2;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ListOfExpensesScreen(this.widget)),
                    );
                  }
                : null,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/CustomContainer.dart';
import '../models/Expense.dart';
import '../models/DBProvider.dart';
import '../widgets/DropDownCategorySelect.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/GradientBackground.dart';

class ListOfExpensesScreen extends StatefulWidget {
  final DBProvider _dbProvider = DBProvider();
  final Widget bottomNavigationBar;
  final DropDownCategorySelect categorySelect = DropDownCategorySelect();
  List<Expense> listOfExpenses = [];

  ListOfExpensesScreen(this.bottomNavigationBar);

  @override
  _ListOfExpensesScreenState createState() => _ListOfExpensesScreenState();
}

class _ListOfExpensesScreenState extends State<ListOfExpensesScreen> {

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
          child:
          widget.listOfExpenses.length == 0 ?
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              CustomAppBar(
                width: width,
                height: height * 0.1,
                text: "List of expenses",
              ),
              SizedBox(
                height: height * 0.3,
              ),
              CustomContainer(
                width: width,
                height: height,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: const Text(
                    "There is no data. Add new data on another screen.",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.384,
              ),
              widget.bottomNavigationBar,
            ],
          )
              :
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              CustomAppBar(
                width: width,
                height: height * 0.1,
                text: "List of expenses",
              ),
              SizedBox(
                height: height * 0.05,
              ),

              SizedBox(
                height: height * 0.115,
              ),
              widget.bottomNavigationBar,
            ],
          ),
        ),
      ),
    );
  }

  void getData() {
    widget._dbProvider.expenses().then((list) {
      setState(() {
        widget.listOfExpenses = list;
      });
    });
  }
}

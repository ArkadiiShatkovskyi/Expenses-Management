import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/DropDownCategorySelect.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/GradientBackground.dart';

class ListOfExpensesScreen extends StatefulWidget {
  final Widget bottomNavigationBar;
  final DropDownCategorySelect categorySelect = DropDownCategorySelect();

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
          child: Column(
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
}

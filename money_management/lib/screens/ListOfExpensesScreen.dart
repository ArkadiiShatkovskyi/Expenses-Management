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
  void initState() {
    getData();
    super.initState();
  }

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
          child: widget.listOfExpenses.length > 0
              ? Column(
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
                      height: height * 0.02,
                    ),
                    SizedBox(
                      width: width,
                      height: height * 0.68,
                      child: ListView.builder(
                        itemCount: widget.listOfExpenses.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: _getIconOfCategory(
                                widget.listOfExpenses[index].category),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: width * 0.4,
                                  child: Text(
                                    widget.listOfExpenses[index].category,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.3,
                                  child: Text(
                                    widget.listOfExpenses[index].price
                                        .toString() + " PLN",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.089,
                    ),
                    widget.bottomNavigationBar,
                  ],
                )
              : Column(
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
                ),
        ),
      ),
    );
  }

  void getData() {
    widget._dbProvider.expenses().then((list) {
      if (mounted) {
        setState(() {
          widget.listOfExpenses = list;
        });
      }
    });
  }

  Widget _getIconOfCategory(String c) {
    switch (c) {
      case "Food":
        return Icon(Icons.emoji_food_beverage_outlined);
        break;
      case "Electronic":
        return Icon(Icons.electrical_services_outlined);
        break;
      case "Food delivery":
        return Icon(Icons.fastfood_outlined);
        break;
      case "Clothes":
        return Icon(Icons.attribution_outlined);
        break;
      case "Vape":
        return Icon(Icons.smart_button_outlined);
        break;
      case "Other":
        return Icon(Icons.attach_money_outlined);
        break;
    }
  }
}

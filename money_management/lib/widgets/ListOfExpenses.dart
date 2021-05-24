import 'package:flutter/material.dart';
import 'package:money_menagment/screens/EditExpenseScreen.dart';

import '../models/Expense.dart';
import '../models/DBProvider.dart';
import '../widgets/CustomContainer.dart';

class ListOfExpense extends StatefulWidget {
  final DBProvider _dbProvider = DBProvider();

  @override
  State<StatefulWidget> createState() => _ListOfExpenseState();
}

class _ListOfExpenseState extends State<ListOfExpense> {
  List<Expense> listOfExpenses = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return listOfExpenses.length > 0
        ? SizedBox(
            height: height * 0.789,
            child: ListView(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  width: width,
                  height: height * 0.68,
                  child: ListView.builder(
                    itemCount: listOfExpenses.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading:
                            _getIconOfCategory(listOfExpenses[index].category),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: width * 0.3,
                              child: Text(
                                listOfExpenses[index].category,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.3,
                              child: Text(
                                listOfExpenses[index].price.toString() + " pln",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.12,
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor:
                                    Colors.indigoAccent.withAlpha(200),
                                child: IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    onPressed: () => {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EditExpenseScreen(
                                                      listOfExpenses[index]),
                                            ),
                                          ),
                                        }),
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
                //widget.bottomNavigationBar,
              ],
            ),
          )
        : SizedBox(
            height: height * 0.789,
            child: ListView(
              children: [
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
              ],
            ),
          );
  }

  void getData() {
    widget._dbProvider.expenses().then((list) {
      if (mounted) {
        setState(() {
          listOfExpenses = list;
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
    return Icon(Icons.attach_money_outlined);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/Expense.dart';
import '../models/DBProvider.dart';
import '../widgets/AppNavigationBar.dart';
import '../widgets/AddRecordFields.dart';

// ignore: must_be_immutable
class AddExpense extends StatefulWidget {
  DBProvider _dbProvider;

  AddExpense() {
    _dbProvider = DBProvider();
  }

  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  DateTime _date = DateTime.now();

  TextEditingController _tecPrice = new TextEditingController();
  TextEditingController _tecCategory = new TextEditingController();
  TextEditingController _tecPlace = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add new expense'),
      ),
      bottomNavigationBar: AppNavigationBar(0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.darken,
                color: Colors.deepPurple.withAlpha(200),
                border: Border.all(
                  color: Colors.deepPurple.withAlpha(200),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(30),

                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 4,
                    blurRadius: 3,
                    offset: Offset(7.0, 7.0),
                  )
                ],
              ),
              child: AddRecordFields(
                height: height,
                width: width,
                tecCategory: _tecCategory,
                tecPlace: _tecPlace,
                tecPrice: _tecPrice,
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.04,
                  width: width * 0.4,
                  child: ElevatedButton.icon(
                      onPressed: saveDate,
                      icon: Icon(Icons.save_outlined),
                      label: const Text("Add new record")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void saveDate() {
    Expense expense = new Expense(
        category: _tecCategory.text,
        place: _tecPlace.text,
        price: double.parse(_tecPrice.text),
        date: _date);
    widget._dbProvider.insertExpense(expense);
    /** //Data base connection test
        widget._dbProvider.expenses().then((list) {
        for(Expense l in list){
        print("Category: " + l.category + ", Price: " + l.price.toString() + ", Date: " + _date.toString());
        }
        });
     **/
  }
}

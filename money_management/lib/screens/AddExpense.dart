import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/CustomMessageBox.dart';
import '../widgets/CustomButton.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/CustomContainer.dart';
import '../widgets/GradientBackground.dart';
import '../models/Expense.dart';
import '../models/DBProvider.dart';
import '../widgets/AddRecordFields.dart';

class AddExpense extends StatefulWidget {
  final DBProvider _dbProvider = DBProvider();
  final Widget bottomNavigationBar;

  AddExpense(this.bottomNavigationBar);

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
                text: "Add expenses",
              ),
              SizedBox(
                height: height * 0.05,
              ),
              CustomContainer(
                width: width,
                height: height,
                child: AddRecordFields(
                  height: height,
                  width: width,
                  tecCategory: _tecCategory,
                  tecPlace: _tecPlace,
                  tecPrice: _tecPrice,
                ),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.06,
                    width: width * 0.55,
                    child: CustomButton(
                      text: "Add new record",
                      icon: Icons.save_outlined,
                      onPressed: _showMyDialog,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.2,
              ),
              widget.bottomNavigationBar,
            ],
          ),
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

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CustomMessageBox(
          title: 'Record was saved',
          message: 'Record was saved to database.',
        );
      },
    );
  }
}

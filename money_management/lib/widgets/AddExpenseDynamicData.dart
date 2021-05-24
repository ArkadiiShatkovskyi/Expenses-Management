import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'DropDownCategorySelect.dart';
import 'CustomMessageBox.dart';
import 'CustomButton.dart';
import 'CustomContainer.dart';
import '../models/Expense.dart';
import '../models/DBProvider.dart';
import 'AddRecordFields.dart';

class AddExpenseDynamicData extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AddExpenseDynamicDataState();
}

class _AddExpenseDynamicDataState extends State<AddExpenseDynamicData>{

  final DBProvider _dbProvider = DBProvider();
  final DropDownCategorySelect categorySelect = DropDownCategorySelect();
  DateTime _date = DateTime.now();

  TextEditingController _tecPrice = new TextEditingController();
  TextEditingController _tecPlace = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * 0.739,
      child: ListView(
        children: [
          CustomContainer(
            width: width,
            height: height,
            child: AddRecordFields(
              height: height,
              width: width,
              tecPlace: _tecPlace,
              tecPrice: _tecPrice,
              date: _date,
              dropDownMenu: categorySelect,
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
                  onPressed: saveDate,
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.025,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height * 0.06,
                width: width * 0.55,
                child: CustomButton(
                  text: "Clear data",
                  icon: Icons.delete_outline_outlined,
                  onPressed: () {
                    _dbProvider.clearDataBase();
                    _showMyDialog("Database was deleted", "All data from database was deleted.");
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.115,
          ),
        ],
      ),
    );
  }


  void saveDate() {
    //_dbProvider.showExpense();
    if (_tecPlace.value.text == "" || _tecPrice.value.text == "") {
      _showMyDialog(
          "Enter required fields", "Price, Category or Place was not filled!");
    } else {
      String category = categorySelect.getValue();

      DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
      String date = dateFormat.format(_date);
      DateTime dateTime = dateFormat.parse(date);

      Expense expense = new Expense(
          category: category,
          place: _tecPlace.text,
          price: double.parse(_tecPrice.text),
          date: dateTime);
      _dbProvider.insertExpense(expense);

      _showMyDialog("Record was saved", "Record was saved to database.");
      _tecPlace.text = "";
      _tecPrice.text = "";
      _date = DateTime.now();
    }
    /**
    DateTime d = DateTime(2021,05,21,20,57,31);
    Expense expense = new Expense(
        category: "Food",
        place: "Wroclaw",
        price: 171.0,
        date: d);
    Expense expense2 = Expense(category: "Food", place: "Wroclaw", date: d, price: 34.0);
    _dbProvider.updateExpense(expense, expense2);
    **/
  }

  Future<void> _showMyDialog(String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CustomMessageBox(
          title: title,
          message: message,
        );
      },
    );
  }
}
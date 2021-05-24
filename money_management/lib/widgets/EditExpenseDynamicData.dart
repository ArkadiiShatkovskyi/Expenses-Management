import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/DBProvider.dart';
import '../widgets/CustomButton.dart';
import '../widgets/CustomMessageBox.dart';
import '../models/Expense.dart';
import '../widgets/DropDownCategorySelect.dart';

// ignore: must_be_immutable
class EditExpenseDynamicData extends StatefulWidget {
  final double height;
  final double width;
  Expense expense;
  final DBProvider _dbProvider = DBProvider();
  final TextEditingController _tecPrice = TextEditingController();
  final TextEditingController _tecPlace = TextEditingController();
  DropDownCategorySelect _categorySelect = DropDownCategorySelect();
  DateTime _date = DateTime.now();

  EditExpenseDynamicData({this.height, this.width, Expense expense});

  @override
  _EditExpenseDynamicDataState createState() => _EditExpenseDynamicDataState();
}

class _EditExpenseDynamicDataState extends State<EditExpenseDynamicData> {
  @override
  void initState() {
    widget._tecPlace.text = widget.expense.place;
    widget._tecPrice.text = widget.expense.price.toString();
    widget._categorySelect.dropdownValue = widget.expense.category;
    widget._date = widget.expense.date;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
              top: widget.height * 0.02, bottom: widget.width * 0.05),
          child: const Text(
            'Edit data',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: widget.height * 0.07,
              width: widget.width * 0.25,
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Price",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
            Container(
              width: widget.width * 0.4,
              height: widget.height * 0.07,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: widget._tecPrice,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    hintText: 'Enter a price',
                    hintStyle: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a price';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: widget.height * 0.07,
              width: widget.width * 0.25,
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Category",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
            Container(
              width: widget.width * 0.4,
              height: widget.height * 0.07,
              child: widget._categorySelect,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: widget.height * 0.07,
              width: widget.width * 0.25,
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Place",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
            Container(
              width: widget.width * 0.4,
              height: widget.height * 0.07,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: widget._tecPlace,
                  decoration: const InputDecoration(
                    hintText: 'Enter a place',
                    hintStyle: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter a place';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: widget.height * 0.07,
              width: widget.width * 0.25,
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Date",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
            Container(
              width: widget.width * 0.4,
              height: widget.height * 0.07,
              padding: EdgeInsets.only(top: widget.height * 0.005),
              child: GestureDetector(
                onTap: () => _chooseDate(context),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget._date.toString().substring(0, 10),
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: widget.height * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: widget.height * 0.06,
              width: widget.width * 0.55,
              child: CustomButton(
                text: "Update record",
                icon: Icons.save_outlined,
                onPressed: _updateData,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _updateData() {
    if (widget._tecPlace.value.text == "" ||
        widget._tecPrice.value.text == "") {
      _showMyDialog(
          "Enter required fields", "Price, Category or Place was not filled!");
    } else {
      String category = widget._categorySelect.getValue();

      DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
      String date = dateFormat.format(widget._date);
      DateTime dateTime = dateFormat.parse(date);

      Expense expense = new Expense(
          category: category,
          place: widget._tecPlace.text,
          price: double.parse(widget._tecPrice.text),
          date: dateTime);
      widget._dbProvider.insertExpense(expense);

      _showMyDialog("Record was saved", "Record was saved to database.");
      widget._tecPlace.text = "";
      widget._tecPrice.text = "";
      widget._date = DateTime.now();
    }
  }

  void _chooseDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: widget._date, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != widget._date)
      setState(() {
        widget._date = picked;
        DateTime dtNow = DateTime.now();
        widget._date = widget._date.add(Duration(
            hours: dtNow.hour,
            minutes: dtNow.minute,
            seconds: dtNow.second,
            milliseconds: dtNow.millisecond));
      });
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

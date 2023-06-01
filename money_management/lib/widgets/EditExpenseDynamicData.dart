import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/DBProvider.dart';
import '../widgets/CustomButton.dart';
import '../widgets/CustomMessageBoxWithOptions.dart';
import '../models/Expense.dart';
import '../widgets/DropDownCategorySelect.dart';

class EditExpenseDynamicData extends StatefulWidget {
  final double height;
  final double width;
  final Expense expense;
  final DBProvider _dbProvider = DBProvider();

  EditExpenseDynamicData({required this.height, required this.width, required this.expense});

  @override
  _EditExpenseDynamicDataState createState() => _EditExpenseDynamicDataState();
}

class _EditExpenseDynamicDataState extends State<EditExpenseDynamicData> {

  TextEditingController _tecPrice = TextEditingController();
  TextEditingController _tecPlace = TextEditingController();
  DropDownCategorySelect _categorySelect = DropDownCategorySelect();
  DateTime _date = DateTime.now();

  @override
  void initState() {
    _tecPlace.text = widget.expense.place;
    _tecPrice.text = widget.expense.price.toString();
    _categorySelect.dropdownValue = widget.expense.category;
    _date = widget.expense.date;
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
            'Update values bellow',
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
                  controller: _tecPrice,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: 'Enter a price',
                    hintStyle: Theme.of(context).primaryTextTheme.displaySmall,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
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
                child: Text(
                  "Category",
                  style: Theme.of(context).primaryTextTheme.displaySmall,
                ),
              ),
            ),
            Container(
              width: widget.width * 0.4,
              height: widget.height * 0.07,
              child: _categorySelect,
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
                child: Text(
                  "Place",
                  style: Theme.of(context).primaryTextTheme.displaySmall,
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
                  controller: _tecPlace,
                  decoration: InputDecoration(
                    hintText: 'Enter a place',
                    hintStyle: Theme.of(context).primaryTextTheme.displaySmall,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
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
                child: Text(
                  "Date",
                  style: Theme.of(context).primaryTextTheme.displaySmall,
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
                    _date.toString().substring(0, 10),
                    style: Theme.of(context).primaryTextTheme.displaySmall,
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
    if (_tecPlace.value.text == "" ||
        _tecPrice.value.text == "") {
      _showMyDialog(
          "Enter required fields", "Price, Category or Place was not filled!");
    } else {
      String category = _categorySelect.getValue();

      DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
      String date = dateFormat.format(_date);
      DateTime dateTime = dateFormat.parse(date);

      Expense expense = new Expense(
          category: category,
          place: _tecPlace.text,
          price: double.parse(_tecPrice.text),
          date: dateTime);

      widget._dbProvider.updateExpense(widget.expense, expense);

      _showMyDialog("Record was updated", "Record was updated with new values.");
    }
  }

  void _chooseDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _date)
      setState(() {
        _date = picked;
        DateTime dtNow = DateTime.now();
        _date = _date.add(Duration(
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
        return CustomMessageBoxWithOptions(
          title: title,
          message: message,
        );
      },
    );
  }
}

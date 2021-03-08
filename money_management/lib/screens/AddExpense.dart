import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/Expense.dart';
import '../models/DBProvider.dart';
import '../widgets/AppNavigationBar.dart';

class AddExpense extends StatefulWidget {

  DBProvider _dbProvider;

  AddExpense(){
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
              Container(
                padding:
                EdgeInsets.only(top: height * 0.025, bottom: width * 0.05),
                child: const Text(
                  'Add new record',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.07,
                    width: width * 0.2,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Text("Price"),
                  ),
                  Container(
                    width: width * 0.4,
                    height: height * 0.07,
                    child: TextFormField(
                        controller: _tecPrice,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: const InputDecoration(
                          hintText: 'Enter a price',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a price';
                          }
                          return null;
                        },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.07,
                    width: width * 0.2,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Text("Category"),
                  ),
                  Container(
                    width: width * 0.4,
                    height: height * 0.07,
                    child: TextFormField(
                      controller: _tecCategory,
                      decoration: const InputDecoration(
                        hintText: 'Enter a category',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Choose a category';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.07,
                    width: width * 0.2,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Text("Place"),
                  ),
                  Container(
                    width: width * 0.4,
                    height: height * 0.07,
                    child: TextFormField(
                      controller: _tecPlace,
                      decoration: const InputDecoration(
                        hintText: 'Enter a place',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a place';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.07,
                    width: width * 0.2,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Text("Date"),
                  ),
                  Container(
                    width: width * 0.4,
                    height: height * 0.07,
                    child: GestureDetector(
                      onTap: () => _chooseDate(context),
                      child: Text(_date.toString().substring(0, 10)),
                    ),
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: height * 0.04,
                      width: width * 0.4,
                      child: ElevatedButton.icon(onPressed: saveDate, icon: Icon(Icons.save_outlined), label: const Text("Add new record")),
                    ),
                  ],
              ),
            ],
          ),
        ),
    );
  }

  void saveDate(){
    Expense expense = new Expense(category: _tecCategory.text, place: _tecPlace.text, price: double.parse(_tecPrice.text), date: _date);
    widget._dbProvider.insertExpense(expense);
    /** //Data base connection test
    widget._dbProvider.expenses().then((list) {
      for(Expense l in list){
        print("Category: " + l.category + ", Price: " + l.price.toString() + ", Date: " + _date.toString());
      }
    });
   **/
  }

  void _chooseDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _date)
      setState(() {
        _date = picked;
        DateTime dtNow = DateTime.now();
        _date = _date.add(Duration(hours: dtNow.hour, minutes: dtNow.minute, seconds: dtNow.second, milliseconds: dtNow.millisecond));
      });
  }
}
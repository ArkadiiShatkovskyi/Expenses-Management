import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/DatePickerWidget.dart';
import '../widgets/AppNavigationBar.dart';

class AddExpense extends StatelessWidget{

  double _price = 0.0;
  String _category = "";
  String _place = "";

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
                    height: height * 0.1,
                    width: width * 0.2,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Text("Price"),
                  ),
                  Container(
                    width: width * 0.4,
                    height: height * 0.1,
                    child: TextFormField(
                        initialValue: _price.toString(),
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
                    height: height * 0.1,
                    width: width * 0.2,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Text("Category"),
                  ),
                  Container(
                    width: width * 0.4,
                    height: height * 0.1,
                    child: TextFormField(
                      initialValue: _category,
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
                    height: height * 0.1,
                    width: width * 0.2,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Text("Place"),
                  ),
                  Container(
                    width: width * 0.4,
                    height: height * 0.1,
                    child: TextFormField(
                      initialValue: _place,
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
                    height: height * 0.1,
                    width: width * 0.2,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Text("Date"),
                  ),
                  Container(
                    width: width * 0.4,
                    height: height * 0.1,
                    child: DatePickerWidget(),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
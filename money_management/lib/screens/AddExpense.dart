import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/DatePickerWidget.dart';
import '../widgets/AppNavigationBar.dart';

class AddExpense extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: const Text('Summary screen'),
      ),
      bottomNavigationBar: AppNavigationBar(0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: const Text("Price"),
                ),
                TextFormField(
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: const Text("Category"),
                ),
                TextFormField(
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: const Text("Place"),
                ),
                TextFormField(
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: const Text("Category"),
                ),
                DatePickerWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
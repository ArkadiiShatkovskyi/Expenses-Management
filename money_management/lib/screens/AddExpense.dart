import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/AppNavigationBar.dart';

class AddExpense extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: const Text('Summary screen'),
      ),
      bottomNavigationBar: AppNavigationBar(2),
      body: Container(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:money_menagment/screens/AddExpense.dart';
import 'package:money_menagment/screens/SummaryScreen.dart';

// ignore: must_be_immutable
class AppNavigationBar extends StatefulWidget{

  int itemIndex;

  AppNavigationBar(this.itemIndex);

  @override
  _AppNavigationBarState createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: widget.itemIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
      );
  }

  void _onItemTapped(int index) {
    setState(() {
      if(index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AddExpense()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SummaryScreen()),
        );
      }
      widget.itemIndex = index;
    });
  }
}
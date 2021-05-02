import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:money_menagment/screens/AddExpense.dart';
import 'package:money_menagment/screens/SummaryScreen.dart';

// ignore: must_be_immutable
class CustomBottomNavigationBar extends StatefulWidget {
  int itemIndex;

  CustomBottomNavigationBar(this.itemIndex);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  List<bool> _selected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent.withAlpha(25),
      ),
      child: ToggleButtons(
        children: <Widget>[
          Icon(
            Icons.info,
          ),
          Icon(
            Icons.add,
          ),
          Icon(
            Icons.settings,
          ),
        ],
        onPressed: (int index) {
          setState(() {
            for (int buttonIndex = 0;
                buttonIndex < _selected.length;
                buttonIndex++) {
              if (buttonIndex == index) {
                _selected[buttonIndex] = true;
              } else {
                _selected[buttonIndex] = false;
              }
            }
          });
        },
        isSelected: _selected,
      ),
    );
    /**
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
    ); **/
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
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

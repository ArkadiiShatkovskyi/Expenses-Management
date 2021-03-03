import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppNavigationBar extends StatefulWidget{

  final int itemIndex;

  AppNavigationBar(this.itemIndex);

  @override
  _AppNavigationBarState createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: widget.itemIndex,
        onTap: onBNBClick,
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

  void onBNBClick(int value) {}
}
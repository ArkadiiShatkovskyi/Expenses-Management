import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppNavigationBar extends StatelessWidget{

  final int itemIndex;

  AppNavigationBar(this.itemIndex);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: itemIndex,
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
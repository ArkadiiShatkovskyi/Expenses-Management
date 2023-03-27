import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropDownCategorySelect extends StatefulWidget {
  String dropdownValue = 'Other';

  String getValue() {
    return dropdownValue;
  }

  @override
  State<DropDownCategorySelect> createState() => _DropDownCategorySelectState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DropDownCategorySelectState extends State<DropDownCategorySelect> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: Theme.of(context).primaryTextTheme.displayMedium,
      underline: Container(
        height: 2,
        color: Colors.black.withAlpha(75),
      ),
      onChanged: (String newValue) {
        setState(() {
          widget.dropdownValue = newValue;
        });
      },
      items: <String>[
        'Other',
        'Food',
        'Electronic',
        'Vape',
        'Clothes',
        "Food delivery"
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

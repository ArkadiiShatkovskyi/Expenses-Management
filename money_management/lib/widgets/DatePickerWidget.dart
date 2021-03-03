import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DatePickerWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget>{

  DateTime _date = DateTime.now();

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _chooseDate(context),
      child: Text(_date.toString().substring(0, 10)),
    );
  }
}
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddRecordFields extends StatefulWidget {

  final double height;
  final double width;
  final TextEditingController tecPrice;
  final TextEditingController tecCategory;
  final TextEditingController tecPlace;
  DateTime _date = DateTime.now();

  AddRecordFields({this.height, this.width, this.tecPrice, this.tecPlace, this.tecCategory});

  @override
  _AddRecordFieldsState createState() => _AddRecordFieldsState();
}

class _AddRecordFieldsState extends State<AddRecordFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
          EdgeInsets.only(top: widget.height * 0.025, bottom: widget.width * 0.05),
          child: const Text(
            'Add new record',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: widget.height * 0.07,
              width: widget.width * 0.2,
              padding: const EdgeInsets.only(right: 20),
              child: const Text("Price", style: TextStyle(color: Colors.white),),
            ),
            Container(
              width: widget.width * 0.4,
              height: widget.height * 0.07,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: widget.tecPrice,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  hintText: 'Enter a price',
                  hintStyle: TextStyle(color: Colors.white),
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
              height: widget.height * 0.07,
              width: widget.width * 0.2,
              padding: const EdgeInsets.only(right: 20),
              child: const Text("Category", style: TextStyle(color: Colors.white),),
            ),
            Container(
              width: widget.width * 0.4,
              height: widget.height * 0.07,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: widget.tecCategory,
                decoration: const InputDecoration(
                  hintText: 'Enter a category',
                  hintStyle: TextStyle(color: Colors.white),
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
              height: widget.height * 0.07,
              width: widget.width * 0.2,
              padding: const EdgeInsets.only(right: 20),
              child: const Text("Place", style: TextStyle(color: Colors.white),),
            ),
            Container(
              width: widget.width * 0.4,
              height: widget.height * 0.07,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: widget.tecPlace,
                decoration: const InputDecoration(
                  hintText: 'Enter a place',
                  hintStyle: TextStyle(color: Colors.white),
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
              height: widget.height * 0.07,
              width: widget.width * 0.2,
              padding: const EdgeInsets.only(right: 20),
              child: const Text("Date", style: TextStyle(color: Colors.white),),
            ),
            Container(
              width: widget.width * 0.4,
              height: widget.height * 0.07,
              padding: EdgeInsets.only(top: widget.height * 0.005),
              child: GestureDetector(
                onTap: () => _chooseDate(context),
                child: Text(widget._date.toString().substring(0, 10), style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _chooseDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: widget._date, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != widget._date)
      setState(() {
        widget._date = picked;
        DateTime dtNow = DateTime.now();
        widget._date = widget._date.add(Duration(hours: dtNow.hour, minutes: dtNow.minute, seconds: dtNow.second, milliseconds: dtNow.millisecond));
      });
  }
}

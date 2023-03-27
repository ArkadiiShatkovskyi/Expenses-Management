import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddRecordFields extends StatefulWidget {
  final double height;
  final double width;
  final TextEditingController tecPrice;
  final TextEditingController tecPlace;
  final Widget dropDownMenu;
  DateTime date;

  AddRecordFields(
      {this.height, this.width, this.tecPrice, this.tecPlace, this.date, this.dropDownMenu});

  @override
  _AddRecordFieldsState createState() => _AddRecordFieldsState();
}

class _AddRecordFieldsState extends State<AddRecordFields> {
  final Color color = Colors.black;
  final String fontFamily = 'SunnySpellsBasicRegular';
  final double fontSize = 25;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
              top: widget.height * 0.02, bottom: widget.width * 0.05),
          child: Text(
            'Add new record',
            style: TextStyle(fontSize: 30, color: color, fontFamily: fontFamily),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: widget.height * 0.07,
              width: widget.width * 0.25,
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Price",
                  style: TextStyle(color: color, fontSize: fontSize, fontFamily: fontFamily),
                ),
              ),
            ),
            Container(
              width: widget.width * 0.4,
              height: widget.height * 0.07,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextFormField(
                  style: TextStyle(color: color),
                  controller: widget.tecPrice,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: 'Enter a price',
                    hintStyle: TextStyle(color: color, fontSize: fontSize, fontFamily: fontFamily),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a price';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: widget.height * 0.07,
              width: widget.width * 0.25,
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Category",
                  style: TextStyle(color: color, fontSize: fontSize, fontFamily: fontFamily),
                ),
              ),
            ),
            Container(
              width: widget.width * 0.4,
              height: widget.height * 0.07,
              child: widget.dropDownMenu,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: widget.height * 0.07,
              width: widget.width * 0.25,
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Place",
                  style: TextStyle(color: color, fontSize: fontSize, fontFamily: fontFamily),
                ),
              ),
            ),
            Container(
              width: widget.width * 0.4,
              height: widget.height * 0.07,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextFormField(
                  style: TextStyle(color: color),
                  controller: widget.tecPlace,
                  decoration: InputDecoration(
                    hintText: 'Enter a place',
                    hintStyle: TextStyle(color: color, fontSize: fontSize, fontFamily: fontFamily),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter a place';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: widget.height * 0.07,
              width: widget.width * 0.25,
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Date",
                  style: TextStyle(color: color, fontSize: fontSize, fontFamily: fontFamily),
                ),
              ),
            ),
            Container(
              width: widget.width * 0.4,
              height: widget.height * 0.07,
              padding: EdgeInsets.only(top: widget.height * 0.005),
              child: GestureDetector(
                onTap: () => _chooseDate(context),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.date.toString().substring(0, 10),
                    style: TextStyle(color: color, fontSize: fontSize, fontFamily: fontFamily),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: widget.height * 0.05,
        ),
      ],
    );
  }

  void _chooseDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: widget.date, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != widget.date)
      setState(() {
        widget.date = picked;
        DateTime dtNow = DateTime.now();
        widget.date = widget.date.add(Duration(
            hours: dtNow.hour,
            minutes: dtNow.minute,
            seconds: dtNow.second,
            milliseconds: dtNow.millisecond));
      });
  }
}

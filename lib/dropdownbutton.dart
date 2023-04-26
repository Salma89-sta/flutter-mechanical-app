import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> list = <String>['Mechanical', 'User'];
late bool isUser = true;

class DropDownButton extends StatefulWidget {
  dynamic x;
  String dropdownValue = list.first;
  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 60,
      width: 380,
      child: Center(
        child: (DropdownButton<String>(
          icon: const Icon(
            Icons.arrow_circle_down,
            color: Colors.white,
          ),
          value: widget.dropdownValue,
          //elevation: ,
          style: TextStyle(color: Colors.teal[900], fontSize: 30),
          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              widget.dropdownValue = value!;
              if (widget.dropdownValue== 'Mechanical') {
                isUser = false;
              }
              else if (widget.dropdownValue== 'User') {
                isUser = true;
              }
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,),
            );
          }).toList(),
        )),
      ),
    );
  }
}

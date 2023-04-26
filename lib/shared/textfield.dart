import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFfield extends StatelessWidget{
  TextEditingController variable = new TextEditingController();
  String hinttext= 'Enter Your Username';
  dynamic icon = Icon(Icons.home_outlined);
  TextFfield(this.hinttext, this.icon, this.variable);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Form(
       child: TextFormField(
         controller:variable ,
         cursorWidth: 10,
         decoration: InputDecoration(
           border: UnderlineInputBorder(),
           labelText: hinttext,
           prefixIcon:  icon,
          // errorText: validator ,
         ),

       ),
     );
  }
}
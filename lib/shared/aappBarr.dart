import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppBBar extends StatelessWidget{
  String text='';
  AppBBar(this.text);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8,1),
              colors: [
                Colors.deepOrangeAccent.shade700,
                Colors.orange.shade400,
              ]
          ),
        ),
      ),
      title: Text('$text', style: TextStyle(color: Colors.white, fontSize: 30),),
    );
  }
}
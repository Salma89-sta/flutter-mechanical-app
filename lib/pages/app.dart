import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';
import 'package:splashscreen/splashscreen.dart';
import 'package:untitled9/basicScreens/first.dart';
import 'package:untitled9/basicScreens/login.dart';
import 'mechanical/addNote.dart';
import 'mechanical/mechanical-addUpdateToUser.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'car saver',
      home: FirstScreen(),
      routes: {
        "addnotes":(context)=>AddNotes(),
      },
    );
  }
}

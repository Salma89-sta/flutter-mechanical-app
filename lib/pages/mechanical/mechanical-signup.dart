import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/authentication/ttt.dart';
import 'package:untitled9/shared/button.dart';

import '../../shared/aappBarr.dart';
import '../../shared/textfield.dart';
import 'mechanical-home.dart';

class MechanicalSignup extends StatelessWidget {
  TextEditingController locationn = new TextEditingController();
  TextEditingController experiensee = new TextEditingController();

  AuthenticationMethods authenticationmethods = AuthenticationMethods();
  final currentUser = FirebaseAuth.instance;
  String currentID = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: AppBBar(''),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:100, left: 20, right: 20),
            child: Text(
              'Location',
              style: TextStyle(fontSize: 25, color: Colors.teal[900]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFfield(
                'Enter Your location', Icon(Icons.directions_car), locationn),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Text(
              'Experience',
              style: TextStyle(fontSize: 25, color: Colors.teal[900]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFfield(
                'Enter your experience', Icon(Icons.directions_car), experiensee),
          ),
          Padding(
            padding: const EdgeInsets.only(top:100.0),
            child: Button(
                Text(
                  'Sign up',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                350, () async{
              String image ='/data/user/0/com.example.untitled9/cache/image_picker200928130523399634.png';
              FirebaseFirestore.instance.collection('user').doc(currentID).update(<String,dynamic>{
                'location': locationn.text,
                'experiensee': experiensee.text,
                'image': image,
              });
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MechHome()));
            }),
          ),
        ],
      ),
    );
  }
}

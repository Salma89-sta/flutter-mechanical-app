import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/basicScreens/login.dart';
import 'package:untitled9/authentication/ttt.dart';
import 'package:untitled9/pages/user/user_home.dart';
import '../../shared/aappBarr.dart';
import '../../shared/button.dart';
import '../../shared/textfield.dart';


class UserSignup extends StatelessWidget {

  TextEditingController cartype = new TextEditingController();
  TextEditingController model = new TextEditingController();
  TextEditingController color = new TextEditingController();
  TextEditingController license = new TextEditingController();

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
              'Car type',
              style: TextStyle(fontSize: 25, color: Colors.teal[900]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,),
            child: TextFfield(
                'Enter Your car type', Icon(Icons.electric_car), cartype),
          ),
          Padding(
            padding: const EdgeInsets.only(top:25, left: 20, right: 20),
            child: Text('Car model',
                style: TextStyle(fontSize: 25, color: Colors.teal[900])),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFfield(
                'Enter your car model', Icon(Icons.model_training_rounded), model),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
            child: Text(
              'Car color',
              style: TextStyle(fontSize: 25, color: Colors.teal[900]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFfield(
                'Enter your car color', Icon(Icons.color_lens_outlined), color),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
            child: Text(
              'License',
              style: TextStyle(fontSize: 25, color: Colors.teal[900]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFfield(
                'Enter your license', Icon(Icons.credit_card), license),
          ),


          Padding(
            padding: const EdgeInsets.only(top:100),
            child: Button(
                Text(
                  'Sign up',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                350,
                    () async{
                  String image ='/data/user/0/com.example.untitled9/cache/image_picker2178994837916377678.png';
                      FirebaseFirestore.instance.collection('user').doc(currentID).update(<String,dynamic>{
                        'carType': cartype.text,
                        'carcolor': color.text,
                        'carModel': model.text,
                        'licence': license.text,
                        'image': image,
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>UserHome()));
                }
                ),
          ),

        ],
      ),
    );
  }
}

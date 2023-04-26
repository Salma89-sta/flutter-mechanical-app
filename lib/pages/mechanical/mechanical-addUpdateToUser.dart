import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/shared/aappBarr.dart';
import 'package:untitled9/shared/button.dart';

import 'mechanicalUpdateToUser.dart';

class AddUpdate extends StatelessWidget {
  final currentUser = FirebaseAuth.instance;
  String currentID = FirebaseAuth.instance.currentUser!.uid;

  TextEditingController note =TextEditingController();
  TextEditingController num =TextEditingController();
  String userPhone ;
  AddUpdate(this.userPhone);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: AppBBar('Add Update'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: note,
                    decoration: InputDecoration(
                        hintText: "إضافه التعديل",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.note),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      controller: num,
                      decoration: InputDecoration(
                          hintText: "رقم التعديل",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.countertops),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Button(Text('update', style: TextStyle(color: Colors.white, fontSize: 25),), 150,  () {
                String x = note.text;
                String z = num.text;
                FirebaseFirestore.instance
                    .collection("update").add(<String, dynamic>{
                  "note": x,
                  "num": z,
                  "mechanicalCurrentId": currentID,
                  "userPhone":userPhone,
                });
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeUpdate(userPhone)));
              },),
            ),
            /*MaterialButton(
              color: Colors.deepOrangeAccent,
              onPressed:
                  () {
                String x = note.text;
                String z = num.text;
                FirebaseFirestore.instance
                    .collection("update").add(<String, dynamic>{
                  "note": x,
                  "num": z,
                  "mechanicalCurrentId": currentID,
                  "userPhone":userPhone,
                });
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeUpdate(userPhone)));
              },
              child: Text('update'),
            ),*/
          ],
        ),
      ),
    );
  }
}
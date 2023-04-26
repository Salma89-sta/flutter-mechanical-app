import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class View extends StatelessWidget {
  String docId=' ';
  final currentUser = FirebaseAuth.instance;
  String currentID = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child:
        FutureBuilder(
          future: FirebaseFirestore.instance.collection('user').doc(currentID).get(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData == false) {
              return Text('No Data');
            }
            else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Text(snapshot.data.docs[index]['name']);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

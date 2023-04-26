import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/pages/user/user-mymechanical.dart';
import '../../shared/aappBarr.dart';
import '../../shared/button.dart';
import '../../shared/cardscustomer.dart';
import '../../shared/cardsmechanical.dart';

class ChooseMechanical extends StatelessWidget{

  final currentUser = FirebaseAuth.instance;
  String currentID = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        flexibleSpace:AppBBar('Choose mechanical'),
      ),
      body: ListView(
        children: [
         Container(
            width: 200,
                height:700,
                child:  FutureBuilder(
                    future: FirebaseFirestore.instance.collection('user').where('type', isNotEqualTo: 'User').get(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData == false) {
                        return Text('No Data');
                      }
                      else {
                        return ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            return CarddsMechanical(snapshot.data.docs[index]["experiensee"],snapshot.data.docs[index]["image"],snapshot.data.docs[index]["location"], snapshot.data.docs[index]["name"],(){
                              FirebaseFirestore.instance.collection('user').doc(currentID).collection('myMechanicals').add(<String,dynamic>{
                                'mechName':snapshot.data.docs[index]["name"],
                                'mechLicense':snapshot.data.docs[index]["experiensee"],
                                'mechLocation':snapshot.data.docs[index]["location"],
                                'image':snapshot.data.docs[index]["image"],
                                'phone':snapshot.data.docs[index]['phone'],
                              });
                            });
                          },
                        );
                      }
                    }
                ),

              ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
            child: Button(Text('Back', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),), 150,(){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyMechanical()));}),
          ),
        ],
      ),
    );
  }
}
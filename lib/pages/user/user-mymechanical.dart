import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/pages/user/user_mechanicaldata.dart';
import 'package:untitled9/pages/user/usertochoosemechanical.dart';
import 'package:untitled9/shared/listtiteldrawer.dart';

import '../../basicScreens/login.dart';
import '../../shared/aappBarr.dart';
import '../../shared/bottomnavigationbar.dart';
import '../../shared/button.dart';
import '../../shared/cardsmechanical.dart';
import '../../shared/imagedrawer.dart';
import '../chat.dart';
import '../myList.dart';


class MyMechanical extends StatelessWidget{

  final currentUser = FirebaseAuth.instance;
  String currentID = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        flexibleSpace:AppBBar('My mechanicals'),
      ),
      body: ListView(
        children: [
          //Search(),
          Container(
            width: 200,
            height: 600,
            child: FutureBuilder(
                future: FirebaseFirestore.instance.collection('user').doc(currentID).collection('myMechanicals').get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData == false) {
                    return Text('No Data');
                  }
                  else {
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {return CarddsMechanical(snapshot.data.docs[index]["mechLicense"],snapshot.data.docs[index]["image"],snapshot.data.docs[index]["mechLocation"], snapshot.data.docs[index]["mechName"],(){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> mechdata(snapshot.data.docs[index]["image"], snapshot.data.docs[index]["phone"], snapshot.data.docs[index]["mechName"], snapshot.data.docs[index]["mechLicense"], snapshot.data.docs[index]["mechLocation"])),

                        );});

                      },
                    );
                  }
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20, left: 20, bottom: 20),
            child: Button(Text('Add', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 25),), 150, (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ChooseMechanical()));
            }),
          ),

        ],
      ),
      drawer: Drawer(
        child:  SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 200,
                height: 300,
                child:
                FutureBuilder(
                    future: FirebaseFirestore.instance.collection('user').doc(currentID).get(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData == false) {
                        return Text('No Data');
                      }
                      return ImageDrawer(snapshot.data['image'], snapshot.data['name']);
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:18),
                child: listtitel('My.list','قائمه المواعيد',Icon(Icons.wysiwyg_rounded),(){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyList()));}),
              ),
              listtitel('chats','My.Chats',Icon(Icons.chat),(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Chats()));}),
              listtitel('Logout','Bye-Bye!',Icon(Icons.logout,size: 20,),(){Navigator.push(context, MaterialPageRoute(builder: (context)=> Firts() ));}),
            ],
          ),
        ),
      ),
      bottomNavigationBar:bottomnavigationbar(1) ,
    );
  }
}
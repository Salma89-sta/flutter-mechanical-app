import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../basicScreens/login.dart';
import '../../shared/aappBarr.dart';
import '../../shared/button.dart';
import '../../shared/cardscustomer.dart';
import '../../shared/imagedrawer.dart';
import '../../shared/listtiteldrawer.dart';
import '../../shared/mechanicalbottomnavigationbar.dart';
import '../chat.dart';
import '../myList.dart';
import 'mechanical_customerdata.dart';
import 'mechanicaltochoosecustomet.dart';

class MyCustomer extends StatelessWidget{
  final currentUser = FirebaseAuth.instance;
  String currentID = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        flexibleSpace:AppBBar('Customers'),
      ),
      body: ListView(
        children: [
         // Search(),
          Container(
            width: 200,
            height: 600,
            child: FutureBuilder(
                future: FirebaseFirestore.instance.collection('user').doc(currentID).collection('customers').get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData == false) {
                    return Text('No Data');
                  }
                  else {
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {return CardsCustomer(snapshot.data.docs[index]["carModel"],snapshot.data.docs[index]["image"],snapshot.data.docs[index]["carType"], snapshot.data.docs[index]["customerName"],(){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> CustomerData(snapshot.data.docs[index]["phone"], snapshot.data.docs[index]["customerName"], snapshot.data.docs[index]["carType"], snapshot.data.docs[index]["color"], snapshot.data.docs[index]["carModel"], snapshot.data.docs[index]["image"])));
                      });
                      },
                    );
                  }
                }
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 20, bottom: 20, left:140),
                child: Button(Text('Add', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),), 150,(){Navigator.push(context, MaterialPageRoute(builder: (context)=> ChooseCustomer()));}),
              ),
              /*Padding(
                padding: const EdgeInsets.only(right: 50, top: 20, bottom: 20),
                child: Button(Text('Delete', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),), 150,(){Navigator.push(context, MaterialPageRoute(builder: (context)=> DeleteMyCustomer()));}),
              ),
            ],
          ),*/

        ],
      ),]),
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
      bottomNavigationBar:bottomnavigationbarmech(1) ,
    );
  }
}
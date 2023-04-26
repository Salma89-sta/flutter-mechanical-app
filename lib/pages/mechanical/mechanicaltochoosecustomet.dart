import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/shared/cardscustomer.dart';
import '../../shared/button.dart';
import '../../shared/imagedrawer.dart';
import '../../shared/listtiteldrawer.dart';
import '../../shared/search.dart';
import '../chat.dart';
import '../../authentication/cloud_firestore_methods.dart';
import '../../basicScreens/login.dart';
import '../myList.dart';

class ChooseCustomer extends StatelessWidget{
  String currentID = FirebaseAuth.instance.currentUser!.uid;
  CloudFirestoreClass cloudFirestoreClass = CloudFirestoreClass();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
      body: ListView(
        children: [
          //Search(),
          Container(
            width: 200,
            height: 700,
            child: FutureBuilder(
                future: FirebaseFirestore.instance.collection('user').where('type', isEqualTo: 'User').get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData == false) {
                    return Text('No Data');
                  }
                  else {
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return CardsCustomer(snapshot.data.docs[index]["carModel"],snapshot.data.docs[index]["image"],snapshot.data.docs[index]["carType"], snapshot.data.docs[index]["name"],(){
                        FirebaseFirestore.instance.collection('user').doc(currentID).collection('customers').add(<String,dynamic>{
                          'customerName':snapshot.data.docs[index]["name"],
                          'carType':snapshot.data.docs[index]["carType"],
                          'carModel':snapshot.data.docs[index]["carModel"],
                          'image':snapshot.data.docs[index]["image"],
                          'phone':snapshot.data.docs[index]["phone"],
                          'color':snapshot.data.docs[index]["carcolor"],
                        });
                      });
                      },
                    );
                  }
                }
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 20, left: 20, bottom: 20),
                child: Button(Text('Skip', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 25),), 150, (){Navigator.pop(context);}),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
                child: Button(Text('Next', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),), 150,(){Navigator.pop(context);}),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
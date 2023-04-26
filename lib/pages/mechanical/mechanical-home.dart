import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/pages/chat.dart';
import 'package:untitled9/basicScreens/login.dart';
import 'package:untitled9/pages/myList.dart';
import '../../shared/aappBarr.dart';
import '../../shared/homecards.dart';
import '../../shared/imagedrawer.dart';
import '../../shared/listtiteldrawer.dart';
import '../../shared/mechanicalbottomnavigationbar.dart';
import '../../shared/profile_pic.dart';


class MechHome extends StatefulWidget{

  @override
  State<MechHome> createState() => _MechHomeState();
}

class _MechHomeState extends State<MechHome> {
  String Cars='' ;
  String Customers='' ;
  final currentUser = FirebaseAuth.instance;
  String currentID = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: AppBBar('Home'),
      ),
      body:ListView(
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
                  return ProfilePicture(snapshot.data['name'], snapshot.data['image']);
                      }
            ),
            ),
          //ProfilePicture(name),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20,right: 20),
            child:  Container(
              width: 200,
              height: 70,
              child:
              FutureBuilder(
                  future: FirebaseFirestore.instance.collection('user').doc(currentID).get(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData == false) {
                      return Text('No Data');
                    }
                    return HomeCards(snapshot.data['phone'],
                      Icon(Icons.phone, color: Colors.teal[900], size: 30,),
                      IconButton(
                        color: Colors.grey,
                        onPressed: () {},
                        icon: Icon(Icons.update_disabled_rounded,),),
                    );
                  }),
     ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20,right: 20),
            child: FutureBuilder(
                future: FirebaseFirestore.instance.collection('user').doc(currentID).get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData == false) {
                    return Text('No Data');
                  }
                  return HomeCards(snapshot.data["location"] , Icon(Icons.location_on, color: Colors.teal[900], size: 30,),IconButton(
                    color: Colors.grey,
                    onPressed: () {  }, icon:Icon(Icons.update_disabled_rounded,),),);
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20,right: 20),
            child:
            FutureBuilder(
                future: FirebaseFirestore.instance.collection('user').doc(currentID).get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData == false) {
                    return Text('No Data');
                  }
                  return HomeCards(snapshot.data['experiensee'], Icon(Icons.hourglass_bottom, color: Colors.teal[900], size: 30,),IconButton(
                    color: Colors.grey,
                    onPressed: () {  }, icon:Icon(Icons.update_disabled_rounded,),),);
                }),
          ),
          Container(
            width: 200,
            height: 100,
            child: FutureBuilder(
                future: FirebaseFirestore.instance.collection('user').doc(currentID).collection('customers').get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData == false) {
                    return Text('No Data');
                  }
                  else {
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {return Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20,right: 20),
                        child: HomeCards('Customers:' +(snapshot.data.docs.length).toString(), Icon(Icons.people, color: Colors.teal[900], size: 30,),IconButton(
                          color: Colors.grey,
                          onPressed: () {  }, icon:Icon(Icons.update_disabled_rounded,),),),
                      );
                      },
                    );
                  }
                }
            ),
          ),
          Container(
            width: 200,
            height: 100,
            child: FutureBuilder(
                future: FirebaseFirestore.instance.collection('user').doc(currentID).collection('carAdded').get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData == false) {
                    return Text('No Data');
                  }
                  else {
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {return Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20,right: 20),
                        child: HomeCards('Cars:' +(snapshot.data.docs.length).toString(), Icon(Icons.people, color: Colors.teal[900], size: 30,),IconButton(
                          color: Colors.grey,
                          onPressed: () {  }, icon:Icon(Icons.update_disabled_rounded,),),),
                      );
                      },
                    );
                  }
                }
            ),
          ),
        ],
      ),
      bottomNavigationBar:bottomnavigationbarmech(0) ,
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
    );
  }

}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/shared/button.dart';

import '../../shared/aappBarr.dart';
import 'mechanical-addUpdateToUser.dart';
import 'mechanical-mycustomers.dart';

class HomeUpdate extends StatefulWidget {
  String userPhone;
  HomeUpdate(this.userPhone);
  @override
  State<HomeUpdate> createState() => _HomeUpdateState();
}

class _HomeUpdateState extends State<HomeUpdate> {
  final currentUser = FirebaseAuth.instance;
  String currentID = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddUpdate(widget.userPhone)));
        },child: Icon(Icons.add),),
        appBar: AppBar(
          flexibleSpace: AppBBar('Your notes'),
        ),
      body: Column(
        children: [
          Center(
            child:Container(
              height: 700,
              child: FutureBuilder(
                          future: FirebaseFirestore.instance.collection("update").where('userPhone', isEqualTo: widget.userPhone).get(),
                          builder: (context,AsyncSnapshot Snapshot)
                          {
                            if(Snapshot.hasData==false)
                              return Text("no data");
                            else{
                              return ListView.builder(
                                  itemCount:Snapshot.data.docs.length,
                                  itemBuilder:(context,index){ return
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:40,left:70,top: 30),
                                          child: Center(
                                            child: Container(
                                                width: 300,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                                    color: Colors.grey.shade200,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 10.0,
                                                        offset: Offset(0.0, 10.0),
                                                      )
                                                    ]),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(Snapshot.data.docs [index]["note"],style:TextStyle(fontSize: 23,color: Colors.teal.shade900,),textAlign: TextAlign.right,),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(Snapshot.data.docs [index]["num"],style:TextStyle(fontSize: 23,color: Colors.grey,),textAlign: TextAlign.right,),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ],
                                    );}
                              );
                            }
                          }
                      ),
            )
          ),
          Button(Text('Back', style: TextStyle(color: Colors.white, fontSize: 25),), 150, (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyCustomer()));}),
        ],
      )
    );
  }
}
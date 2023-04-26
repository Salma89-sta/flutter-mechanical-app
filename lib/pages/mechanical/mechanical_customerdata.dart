import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/shared/aappBarr.dart';
import 'package:untitled9/shared/profile_pic.dart';
import '../../basicScreens/login.dart';
import '../../shared/button.dart';
import '../../shared/homecards.dart';
import '../../shared/imagedrawer.dart';
import '../../shared/listtiteldrawer.dart';
import '../chat.dart';
import '../myList.dart';
import 'mechanical-mycustomers.dart';
import 'mechanicalUpdateToUser.dart';

class CustomerData extends StatefulWidget {
   //CustomerData({Key? key}) : super(key: key);
   String phone='' ;
   String name='' ;
   String licence='' ;
   String carmodel='' ;
   String carcolor='';
   String cartype='';
   String image='';
   CustomerData(this.phone, this.name, this.cartype, this.carcolor, this.carmodel, this.image);
  @override
  State<CustomerData> createState() => _CustomerDataState();
}

class _CustomerDataState extends State<CustomerData> {

  String numofmechanicals='2' ;
  final currentUser = FirebaseAuth.instance;
  String currentID = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: AppBBar(''),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ProfilePicture(widget.name, widget.image),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20,right: 20),
                child: HomeCards(widget.phone, Icon(Icons.phone, color: Colors.teal[900], size: 30,),''),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20,right: 20),
                child: HomeCards(widget.cartype, Icon(Icons.directions_car_sharp, color: Colors.teal[900], size: 30,),''),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20,right: 20),
                child: HomeCards(widget.carmodel, Icon(Icons.directions_car_sharp, color: Colors.teal[900], size: 30,),'',),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20,right: 20),
                child: HomeCards(widget.carcolor, Icon(Icons.directions_car_sharp, color: Colors.teal[900], size: 30,),'',),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Button(Text('Back', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 25),), 150,(){Navigator.push(context, MaterialPageRoute(builder: (context)=> MyCustomer()));}),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Button(Text('Updates', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 25),), 150,(){Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeUpdate(widget.phone)));}),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
    );
  }
}
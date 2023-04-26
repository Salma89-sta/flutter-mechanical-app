
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/shared/aappBarr.dart';
import 'package:untitled9/shared/listtiteldrawer.dart';
import 'package:untitled9/shared/profile_pic.dart';
import '../../basicScreens/login.dart';
import '../../shared/bottomnavigationbar.dart';
import '../../shared/homecards.dart';
import '../../shared/imagedrawer.dart';
import '../chat.dart';
import '../../authentication/cloud_firestore_methods.dart';
import '../myList.dart';


class UserHome extends StatelessWidget{

  late String name=' ';
  late String phone='';
  late String email='';
  late String licence='';
  late String carmodel='' ;
  late String carcolor='';
  late String cartype='';
  late String numofmechanicals='';

  final currentUser = FirebaseAuth.instance;
  String currentID = FirebaseAuth.instance.currentUser!.uid;

  CloudFirestoreClass cloudFirestoreClass = CloudFirestoreClass();

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
     return Scaffold(
       appBar: AppBar(
         flexibleSpace: AppBBar('Home'),
       ),
       bottomNavigationBar:bottomnavigationbar(0) ,
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
           children:[
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
             Padding(
               padding: const EdgeInsets.only(top: 20, left: 20,right: 20),
               child:FutureBuilder(
                   future: FirebaseFirestore.instance.collection('user').doc(currentID).get(),
                   builder: (context, AsyncSnapshot snapshot) {
                     if (snapshot.hasData == false) {
                       return Text('No Data');
                     }
                     return  HomeCards(snapshot.data['phone'], Icon(Icons.phone, color: Colors.teal[900], size: 30,),IconButton(
                       color: Colors.grey,
                       onPressed: () {  }, icon:Icon(Icons.update_disabled_rounded,),),);
                   }
               ),

             ),
             Padding(
               padding: const EdgeInsets.only(top: 20, left: 20,right: 20),
               child:FutureBuilder(
                   future: FirebaseFirestore.instance.collection('user').doc(currentID).get(),
                   builder: (context, AsyncSnapshot snapshot) {
                     if (snapshot.hasData == false) {
                       return Text('No Data');
                     }
                     return  HomeCards(snapshot.data['carType'],  Icon(Icons.electric_car, color: Colors.teal[900], size: 30,),IconButton(
                       color: Colors.grey,
                       onPressed: () {  }, icon:Icon(Icons.update_disabled_rounded,),),);
                   }
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
                     return  HomeCards(snapshot.data['carcolor'], Icon(Icons.color_lens_outlined, color: Colors.teal[900], size: 30,),IconButton(
                       color: Colors.grey,
                       onPressed: () {  }, icon:Icon(Icons.update_disabled_rounded,),),);
                   }
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
                     return  HomeCards(snapshot.data['carModel'], Icon(Icons.model_training_rounded, color: Colors.teal[900], size: 30,),IconButton(
                       color: Colors.grey,
                       onPressed: () {  }, icon:Icon(Icons.update_disabled_rounded,),),);
                   }
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
                     return  HomeCards(snapshot.data['licence'], Icon(Icons.credit_card, color: Colors.teal[900], size: 30,),IconButton(
                       color: Colors.grey,
                       onPressed: () {  }, icon:Icon(Icons.update_disabled_rounded,),),);
                   }
               ),
             ),
           ],
       ),
     );
  }
}

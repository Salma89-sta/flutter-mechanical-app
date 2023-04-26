import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../shared/aappBarr.dart';
import '../../shared/button.dart';
import '../../shared/imagedrawer.dart';
import '../../shared/listtiteldrawer.dart';
import '../../shared/mechanicalbottomnavigationbar.dart';
import '../../shared/textfield.dart';
import '../chat.dart';
import '../../basicScreens/login.dart';
import 'mechanical_mycars.dart';
import '../myList.dart';


class AddCar extends StatefulWidget{
  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {


  TextEditingController name = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController carModel = new TextEditingController();
  TextEditingController carColor = new TextEditingController();
  TextEditingController carType = new TextEditingController();
  TextEditingController license = new TextEditingController();



  final currentUser = FirebaseAuth.instance;
  String currentID = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        flexibleSpace:AppBBar('Add car'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Text('Name', style: TextStyle(fontSize: 25,color: Colors.teal[900]),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFfield('Customer name', Icon(Icons.perm_identity),name),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Text('Phone', style: TextStyle(fontSize: 25,color: Colors.teal[900]),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFfield('Enter phone', Icon(Icons.phone),phone,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Text('Car type', style: TextStyle(fontSize: 25,color: Colors.teal[900]),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFfield('Enter car type', Icon(Icons.electric_car),carType,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Text('Car model', style: TextStyle(fontSize: 25,color: Colors.teal[900]),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFfield('Enter car model', Icon(Icons.model_training_rounded),carModel,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20,right: 20),
            child: Text('Car color', style: TextStyle(fontSize: 25,color: Colors.teal[900]),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFfield('Enter car color', Icon(Icons.color_lens_outlined),carColor,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20,right: 20),
            child: Text('License', style: TextStyle(fontSize: 25,color: Colors.teal[900]),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFfield('Enter license', Icon(Icons.credit_card),license),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20,bottom: 10),
            child: Button(Text( 'Save car', style: TextStyle(fontSize: 30, color: Colors.white),), 300,(){
               FirebaseFirestore.instance.collection('user').doc(currentID).collection('carAdded').add(<String,dynamic>{
                'userName':name.text,
                'userPhone':phone.text,
                'carType':carType.text,
                'carModel':carModel.text,
                'carColor':carColor.text,
                'license':license.text,
                // 'currentId': FirebaseFirestore.instance.collection('user').doc(currentID).collection('carAdded').doc().id,
              });
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyCars()));
            }

            ),
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
      bottomNavigationBar:bottomnavigationbarmech(2) ,
    );
  }
}
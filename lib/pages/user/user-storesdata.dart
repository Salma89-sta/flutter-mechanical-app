import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../shared/aappBarr.dart';
import '../../shared/bottomnavigationbar.dart';
import '../../shared/homecards.dart';

class StoresData extends StatefulWidget {
  // StoresData({Key? key}) : super(key: key);

  String phone='' ;
  String photo='';
  String name='' ;
  String address='' ;
  String location='';
  StoresData(this.phone,this.address,this.name,this.photo,this.location);
  @override
  State<StoresData> createState() => _StoresDataState();
}

class _StoresDataState extends State<StoresData> {
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius:90 ,
                  backgroundImage: NetworkImage(widget.photo),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20,right: 20),
                child: HomeCards(widget.name, Icon(Icons.person, color: Colors.teal[900], size: 30,),''),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    FlutterPhoneDirectCaller.callNumber(widget.phone);

                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20,right: 20),
                  child: HomeCards(widget.phone, Icon(Icons.phone, color: Colors.teal[900], size: 30,),''),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    launch(widget.location);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20,right: 20),
                  child: HomeCards('Go to Location', Icon(Icons.location_on, color: Colors.teal[900], size: 30,),''),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20,right: 20),
                child: HomeCards(widget.address, Icon(Icons.location_city, color: Colors.teal[900], size: 30,),''),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:bottomnavigationbar(2),

    );
  }
}
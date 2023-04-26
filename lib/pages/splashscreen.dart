import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:splashscreen/splashscreen.dart';
import '../basicScreens/login.dart';

class splashscreen  extends StatefulWidget {
  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SplashScreen(
                seconds: 2 ,
                navigateAfterSeconds: Firts(),
                image: Image.asset('assets/images/splashscreen.png'),
                title: Text('This Applications Helps You To Know Every Thing About Your Car.',style: TextStyle(fontSize: 24,color:Colors.white,),textAlign: TextAlign.center,) ,
                photoSize: 150,
                backgroundColor: Colors.orangeAccent[700],
                styleTextUnderTheLoader: TextStyle(color:Colors.orange[400]),
                loaderColor: Colors.white,
                gradientBackground:LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.orangeAccent.shade700,
                    Colors.orange.shade200,
                  ],
                ),
                onClick: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Firts()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
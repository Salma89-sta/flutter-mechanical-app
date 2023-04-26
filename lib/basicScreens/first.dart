import 'package:flutter/material.dart';
import 'package:untitled9/basicScreens/login.dart';
import 'package:untitled9/basicScreens/signUp.dart';

class FirstScreen extends StatelessWidget {
  var size , width , height;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
height=size.height;
    width=size.width;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: [
                Colors.deepOrangeAccent.shade700,
                Colors.orange.shade400,
              ]),
        ),
        child:SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height*0.2),
                child: Image.asset('assets/images/splashscreen.png', width: width*0.8,),
              ),
              Padding(
                padding:  EdgeInsets.only( left: width*0.05, right: width*0.05),
                child: Container(
                  width: width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: MaterialButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Firts()));

                    },
                    child: Text('LogIn', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent.shade700),),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: height*0.03, left: width*0.05, right: width*0.05),
                child: Container(
                  width: width,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment(0.8, 1),
                        colors: [
                          Colors.deepOrangeAccent.shade700,
                          Colors.orange.shade400,
                        ]),                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: MaterialButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignUp()));
                    },
                    child: Text('SignUp', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
                  ),
                ),
              ),
            ],
          ),
        ) ,
      ),
    );
  }
}

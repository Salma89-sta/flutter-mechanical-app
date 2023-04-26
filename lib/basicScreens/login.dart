import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/shared/button.dart';
import '../pages/mechanical/mechanical-home.dart';
import '../pages/user/user_home.dart';
import '../shared/aappBarr.dart';
import '../shared/textfield.dart';
import '../shared/toast.dart';
import '../pages/main.dart';


class Firts extends StatefulWidget {

  @override
  State<Firts> createState() => _FirtsState();
}

class _FirtsState extends State<Firts> {
  TextEditingController email = new TextEditingController();

  TextEditingController pass = new TextEditingController();

  bool isSecure= true;
  bool passVisible = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: AppBBar(''),
      ),
      body: ListView(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
          //   child: LogSignButton(Colors.white),
          // ),
          Center(
            child: Padding(
              padding:  EdgeInsets.only(top:80),
              child: Text('Welcome,', style:TextStyle(color: Colors.deepOrangeAccent.shade700, fontWeight: FontWeight.bold, fontSize: 35) ,),
            ),
          ),
          Center(
            child: Padding(
              padding:  EdgeInsets.only(top:5),
              child: Text('Glad to see you!', style:TextStyle(color: Colors.deepOrangeAccent, fontSize: 28) ,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
            child: Text(
              'Email',
              style: TextStyle(fontSize: 25, color: Colors.teal[900]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFfield(
                'Enter your email', Icon(Icons.perm_identity), email),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Text(
              'PassWord',
              style: TextStyle(fontSize: 25, color: Colors.teal[900]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: isSecure,
              controller: pass,
              cursorWidth: 10,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your passWord',
                prefixIcon: IconButton(icon: Icon(Icons.lock_outline),onPressed: (){

                },),
                suffixIcon: IconButton(icon: Icon(passVisible? Icons.visibility_off : Icons.visibility),onPressed: (){
                  setState(() {
                    isSecure = !isSecure;
                    passVisible = !passVisible;
                  });
                },),
                //suffixIcon: Icon(Icons.remove_red_eye_outlined),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 100.0,
            ),
            child: Button(
              Text(
                'Log in',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              350,
                    () async {
                      String output=  await authenticationMethods.logInUser(
                        email: email.text,
                        password: pass.text);
                  print(output);

                  if (output == "success")  {
                    final currentUser = FirebaseAuth.instance;
                    String currentID = FirebaseAuth.instance.currentUser!.uid;
                    print('................................................');
                    print(currentID);
                    await FirebaseFirestore.instance.collection('user').doc(currentID).snapshots().forEach((element) {
                      if (element.data()?['type'] == 'User') {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) =>
                            UserHome()));
                      }
                      else {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) =>
                            MechHome()));
                      }
                    });}
                    else {
                      //error
                      Utils().showSnackBar(
                          context: context, content: output.toString());
                    }
  }),)
            ]),

    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import 'package:untitled9/pages/main.dart';
import 'package:untitled9/pages/mechanical/mechanical-signup.dart';
import 'package:untitled9/pages/user/user-signu.dart';
import '../shared/aappBarr.dart';
import '../shared/button.dart';
import '../shared/toast.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _name = new TextEditingController();

  TextEditingController _phone = new TextEditingController();

  TextEditingController _pass = new TextEditingController();

  TextEditingController _email = new TextEditingController();

  TextEditingController type = new TextEditingController();

  bool isSecure= true;

  bool passVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: AppBBar(''),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
              //   child: LogSignButton(Colors.white),
              // ),
              Center(
                child: Padding(
                  padding:  EdgeInsets.only(top: 18),
                  child: Text('Create Account,', style:TextStyle(color: Colors.deepOrangeAccent.shade700, fontWeight: FontWeight.bold, fontSize: 35) ,),
                ),
              ),
              Center(
                child: Padding(
                  padding:  EdgeInsets.only(top:8),
                  child: Text('to get started now!', style:TextStyle(color: Colors.deepOrangeAccent, fontSize: 28) ,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Text(
                  'Name',
                  style: TextStyle(fontSize: 25, color: Colors.teal[900]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  cursorWidth: 10,
                  controller: _name,
                  decoration: InputDecoration(
                    prefixIcon:  Icon(Icons.perm_identity),
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your username',
                   // errorText: _validate ? 'Username Can\'t Be Empty' : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Text(
                  'Phone',
                  style: TextStyle(fontSize: 25, color: Colors.teal[900]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  cursorWidth: 10,
                  controller: _phone,
                  decoration: InputDecoration(
                    prefixIcon:  Icon(Icons.phone),
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your phone',
                   // errorText: _validate ? 'Phone Can\'t Be Empty' : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Text(
                  'Email',
                  style: TextStyle(fontSize: 25, color: Colors.teal[900]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  cursorWidth: 10,
                  controller: _email,
                  decoration: InputDecoration(
                    prefixIcon:  Icon(Icons.credit_card),
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your email',
                   // errorText: _validate ? 'NationalId Can\'t Be Empty' : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Text(
                  'PassWord',
                  style: TextStyle(fontSize: 25, color: Colors.teal[900]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  obscureText: isSecure,
                  controller: _pass,
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
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Text(
                  'Type',
                  style: TextStyle(fontSize: 25, color: Colors.teal[900]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: type,
                  cursorWidth: 10,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Are you User or Mechanical',
                    prefixIcon: Icon(Icons.people_outline_rounded),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 20),
                      child: Button(
                          Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          350, () async{
                        String outPut = await authenticationMethods.signUpUser(name:_name.text, phone:_phone.text, email:_email.text, type:type.text, password:_pass.text);
                        if (outPut == "success") {
                          if (type.text == 'User'){
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> UserSignup()));
                          }
                          else {
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> MechanicalSignup()));
                          }
                        }
                        else {
                          //error
                          Utils().showSnackBar(
                              context: context, content: outPut.toString());
                        }
                        print(outPut);
                      }),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}


import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ProfilePicture extends StatefulWidget{

  final currentUser = FirebaseAuth.instance;
  String currentID = FirebaseAuth.instance.currentUser!.uid;

  dynamic profileImage= '/data/user/0/com.example.untitled9/cache/image_picker200928130523399634.png';
  late String name='Salma Ahmed';
  ProfilePicture(this.name, this.profileImage);
  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child:Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:50),
            child: GestureDetector(
              onTap: () async {
                ImagePicker a = new ImagePicker();
                dynamic b = await a.getImage(source: ImageSource.gallery );
                setState(() {
                  String i ='';
                   Image.file(File(b.path));
                  widget.profileImage=b.path ;
                  FirebaseFirestore.instance.collection('user').doc(widget.currentID).update(<String,dynamic>{
                    'image': b.path ,
                  });
                });
              },
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    width: 200,
                    height: 200,
                    child:Image.file(File(widget.profileImage)),
                    decoration: BoxDecoration(
                      color: Colors.teal[900],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: RichText(
              text: TextSpan(
                text: widget.name,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.teal[900],
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/shared/profile_pic.dart';

class ImageDrawer extends StatefulWidget {
  late String imagecustomer;
  late String namecustomer;

  ImageDrawer(this.imagecustomer,this.namecustomer);


  final currentUser = FirebaseAuth.instance;
  String currentID = FirebaseAuth.instance.currentUser!.uid;
  @override
  State<ImageDrawer> createState() => _ImageDrawerState();
}

class _ImageDrawerState extends State<ImageDrawer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          width: double.infinity,
          height: 200,
child: Image.network('https://s23226.pcdn.co/wp-content/uploads/2018/03/CarSaver.PR_.jpg'),        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:120),
              child: GestureDetector(
                onTap: () async {
                  ImagePicker a = new ImagePicker();
                  dynamic b = await a.getImage(source: ImageSource.gallery );
                  setState(() {
                    Image.file(File(b.path));
                    widget.imagecustomer=b.path ;
                    FirebaseFirestore.instance.collection('user').doc(widget.currentID).update(<String,dynamic>{
                      'image': b.path ,
                    });
                  });
                },
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      width: 150,
                      height: 150,
                      child:Image.file(File(widget.imagecustomer)),
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
            RichText(
              text: TextSpan(
                text: widget.namecustomer,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal[900],
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

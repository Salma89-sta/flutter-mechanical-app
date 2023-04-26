import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarddsMechanical extends StatelessWidget {
  late String mechanicalImage;
  late String mechanicalName;
  late String mechanicalLocation;
  late String mechanicalExperience;
  final VoidCallback ontap;
  CarddsMechanical(this.mechanicalExperience, this.mechanicalImage, this.mechanicalLocation, this.mechanicalName, this.ontap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: GestureDetector(
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.grey.shade100,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: (Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Image.file(File(mechanicalImage)),
                      width: 120,
                      height: 120,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: mechanicalName,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.teal[900],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Location:',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.teal[900],
                                    fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(text: mechanicalLocation,style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20)),
                                ]
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Experience:',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.teal[900],
                                    fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(text: mechanicalExperience , style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20)),
                                ]
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
        onTap:ontap,
      ),
    );
  }
}
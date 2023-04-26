import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardsCustomer extends StatelessWidget {
  late String customerImage;
  late String customerName;
  late String carname;
  late String carmodel;
  final VoidCallback ontap ;
  CardsCustomer(this.carmodel, this.customerImage, this.carname, this.customerName, this.ontap);

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
                    child: Image.file(File(customerImage),
                      width: 120,
                      height: 120,
                    ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '$customerName',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.teal[900],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Car:',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.teal[900],),
                            children: <TextSpan>[
                              TextSpan(text: '$carname' ,style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20)),
                            ]
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Model:',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.teal[900],),
                            children: <TextSpan>[
                              TextSpan(text: '$carmodel' , style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20)),
                            ]
                        ),
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
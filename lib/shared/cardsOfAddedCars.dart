import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardsOfAddedCars extends StatelessWidget {
  late String customerImage;
  late String customerName;
  late String carname;
  late String carmodel;
  final VoidCallback ontap;
  late dynamic function;
  CardsOfAddedCars(this.carmodel,this.carname, this.customerName,this.ontap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: GestureDetector(
        child: Container(
          width: double.infinity,
          height: 100,
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
          child:
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
        onTap:ontap,
      ),
    );
  }
}
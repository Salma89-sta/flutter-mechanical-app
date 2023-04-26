import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCards extends StatelessWidget {
  late dynamic icon;
  late String text;
  dynamic iconButton=IconButton(
  color: Colors.grey,
  onPressed: () {  }, icon:Icon(Icons.update_disabled_rounded,),);
  HomeCards(this.text, this.icon,this.iconButton);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey.shade100,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            icon,
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, top:10),
                  child: Text( '$text',
                    style: TextStyle(color: Colors.teal[900], fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

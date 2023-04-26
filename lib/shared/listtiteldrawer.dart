import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class listtitel extends StatelessWidget {
  late String nameicon;
  late String title;
  dynamic icon;
  final VoidCallback ontap;
  listtitel(this.nameicon,this.title,this.icon, this.ontap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:30.0, left: 20, right: 20),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(
                color: Colors.black45,
                spreadRadius: 0,
                blurRadius: 5

            )]

        ),
        child: ListTile(
          leading: icon,
          title: Text(nameicon,style: TextStyle(color: Colors.teal[700],fontSize: 20 ),),
          onTap:ontap,
          subtitle:Text(title),
        ),
      ),
    );
  }
}

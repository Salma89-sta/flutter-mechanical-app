import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/mechanical/mechanical-home.dart';
import '../pages/mechanical/mechanical-mycustomers.dart';
import '../pages/mechanical/mechanical_mycars.dart';
class bottomnavigationbarmech extends StatefulWidget {
  late int _currentIndex;
  bottomnavigationbarmech(this._currentIndex);
  @override
  State<bottomnavigationbarmech> createState() => _bottomnavigationbarmechState();
}

class _bottomnavigationbarmechState extends State<bottomnavigationbarmech> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepOrangeAccent.shade700, Colors.orange.shade400],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          stops: [0.0, 0.8],
          tileMode: TileMode.clamp,
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: widget._currentIndex,
        onTap: (index) {
          if(index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MechHome()));
            widget._currentIndex= index;
          }
          if(index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyCustomer()));
            widget._currentIndex= index;
          }
          if(index == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyCars()));
            widget._currentIndex= index;
          }
        },
        showUnselectedLabels: false,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation:0,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.teal[900],
        selectedIconTheme: IconThemeData(color: Colors.teal[900]),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "My customers",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_repair_outlined),
            label: "Added cars",
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/user/Stores.dart';
import '../pages/user/user-mymechanical.dart';
import '../pages/user/user_home.dart';

class bottomnavigationbar extends StatefulWidget {
  late int _currentIndex;
  bottomnavigationbar(this._currentIndex);
  @override
  State<bottomnavigationbar> createState() => _bottomnavigationbarState();
}

class _bottomnavigationbarState extends State<bottomnavigationbar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
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
                context, MaterialPageRoute(builder: (context) => UserHome()));
            widget._currentIndex= index;
          }
          if(index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyMechanical()));
            widget._currentIndex= index;
          }
          if(index == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Stores()));
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
            icon: Icon(Icons.build),
            label: "My mechanicals",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets_outlined),
            label: "Stores",
          ),
        ],
      ),
    );
  }
}

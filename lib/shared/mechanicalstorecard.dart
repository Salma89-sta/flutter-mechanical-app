/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreCardds extends StatelessWidget {
  late String image;
  late String name;
  late String location;
  late String phone;
  StoreCardds(this.phone,this.name,this.location,this.image);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all( 10),
      child: Container(
        height: 280,
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
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top:10),
              child: Container(
                child: Image.network(
                  image,
                  width: 120,
                  height: 100,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('$name', style: TextStyle(fontSize:20,
                      color: Colors.teal[900],fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                ),
                Text('$location', style: TextStyle(fontSize: 20,
                  color: Colors.teal[900],), textAlign: TextAlign.center,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text('$phone', style: TextStyle(fontSize:20,
                    color: Colors.teal[900],), textAlign: TextAlign.center,),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}*/
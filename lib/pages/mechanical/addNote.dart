import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/pages/myList.dart';
import 'package:untitled9/pages/sqlDB.dart';
import 'package:untitled9/shared/button.dart';

import '../../shared/aappBarr.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({Key? key}) : super(key: key);
  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  SqlDb sqlDb=SqlDb();

  GlobalKey<FormState>formstate = GlobalKey();

  TextEditingController note =TextEditingController();
  TextEditingController title =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: AppBBar('Add note'),
      ),
      body:Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Form(
                key:formstate,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top:280),
                        child: TextFormField(
                          controller: note,
                          decoration: InputDecoration(
                              hintText: "note",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.notes),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 40),
                        child: TextFormField(
                          controller: title,
                          decoration: InputDecoration(
                              hintText: "title",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.title),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
              Button(Text('Add', style: TextStyle(color: Colors.white, fontSize: 25),), 150, ()async{
          int response = await sqlDb.insertData(
              '''
                             INSERT INTO notes ('note' , 'title' )
                             VALUES ("${note.text}" , "${title.text}" )
                             ''');
          if(response>0){
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>MyList()),
                    (route) => false);
          }

        },),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
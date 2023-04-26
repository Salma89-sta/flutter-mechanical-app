import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/pages/sqlDB.dart';
import 'package:untitled9/shared/aappBarr.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  SqlDb sqlDb=SqlDb();
  Future<List<Map>>readData()async{
    List<Map> response = await sqlDb.readData("SELECT * FROM notes");
    return response;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: AppBBar('List'),
      ),
      floatingActionButton: Container(
        color: Colors.deepOrangeAccent[900],
        child: FloatingActionButton(
          //backgroundColor: Colors.deepOrangeAccent[900],
          onPressed: (){
            Navigator.of(context).pushNamed("addnotes");
          },child: Icon(Icons.add, size:40,),),
      ),
      body: Column(
        children: [
          Container(
            height: 600,
            child: ListView(
              children: [

                FutureBuilder(
                    future: readData(),
                    builder: (BuildContext context ,AsyncSnapshot<List<Map>> snapshot){
                      if (snapshot.hasData){
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context,i){

                              return Card(child: ListTile(
                                title: Text("${snapshot.data![i]['title']}"),
                                subtitle: Text("${snapshot.data![i]['note']}"),
                                trailing: IconButton(
                                  onPressed: ()async{
                                    int response = await sqlDb.deleteData("DELETE FROM notes WHERE id = ${snapshot.data![i]['id']} ");
                                    if(response>0){
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyList()));
                                    }
                                  },
                                  icon: Icon(Icons.delete,color: Colors.red,),
                                ),

                              ));
                            });

                      }
                      return Center(child: Text("No Data"),);
                    })

              ],
            ),
          ),
          //Button(Text('Back'), 150, (){Navigator.pop(context);}),
        ],
      ),

    );
  }
}
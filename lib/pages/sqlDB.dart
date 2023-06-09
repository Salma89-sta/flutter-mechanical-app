import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class SqlDb{

  static Database? _db;

  Future<Database?> get db async{
    if(_db == null){
      _db = await intialDb();
      return _db;
    }else{
      return _db;
    }
  }
  intialDb()async{
    String databasepath = await getDatabasesPath();
    String path = join(databasepath,'wael.db');
    Database mydb = await openDatabase(path,onCreate: _onCreate,version: 20,onUpgrade: _onUpgrade);
    return mydb;
  }
  _onUpgrade(Database db , int oldversion ,int newversion)async{
    print("onUpgrade ==================");
  }
  _onCreate(Database db , int varsion)async{

    Batch batch=db.batch() ;
    batch.execute('''
    CREATE TABLE "notes"(
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "note" TEXT NOT NULL
    )
    ''');
    batch.execute('''
    CREATE TABLE "mass"(
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "note" TEXT NOT NULL
    )
    ''');
    await batch.commit() ;

    print("onCreate ==================");
  }
  readData(String sql)async{
    Database? mydb =await db ;
    List<Map> response =await mydb!.rawQuery(sql) ;
    return response ;
  }
  insertData(String sql)async{
    Database? mydb =await db ;
    int response =await mydb!.rawInsert(sql) ;
    return response ;
  }
  updetData(String sql)async{
    Database? mydb =await db ;
    int response =await mydb!.rawUpdate(sql) ;
    return response ;
  }
  deleteData(String sql)async{
    Database? mydb =await db ;
    int response =await mydb!.rawDelete(sql) ;
    return response ;
  }
  mydeleteDatabase()async{
    String databasepath = await getDatabasesPath();
    String path = join(databasepath,'wael.db');
    await deleteDatabase(path);
  }
}
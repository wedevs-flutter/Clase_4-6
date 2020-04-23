import 'package:logic_class_flutter/models/UserModel.dart';
import 'package:sqflite/sqflite.dart';

class HelperDB {
  static const TABLE_NAME = "usuario";
  
  //crear la DB
  Future<Database> db =
      openDatabase('registro1.db', version: 1, onCreate: (Database db, int i) async {
    await db.execute("""
          CREATE TABLE $TABLE_NAME(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT,
            user TEXT,
            pass TEXT,
            rating INTEGER
          );""");
  });


  Future<int>  insertUser(UserModel userModel) async{
    Database db = await this.db;
    int respuesta = await db.insert(TABLE_NAME, userModel.toMap());
    print("#################################");
    print(">>>>> INSERT $respuesta");
    print("#################################");
    return respuesta;
  }

  Future<List<UserModel>> readUser() async{
    Database db = await this.db;
    List<Map<String, dynamic>> lista = await db.query(TABLE_NAME);   
    final respuesta = lista.map((Map<String, dynamic> data){
      return UserModel.fromMap(data);
    }).toList();

    print("#################################");
    print(">>>>> READ ");
    print("#################################");
    return respuesta.isEmpty ? [] : respuesta;
  }
  Future<List<UserModel>> readUserEmailPass(String email, String pass ) async{
    Database db = await this.db;
    List<Map<String, dynamic>> lista = await db.query(TABLE_NAME, where: "email = ? and pass = ?",whereArgs: [email, pass]);   
    final respuesta = lista.map((Map<String, dynamic> data){
      return UserModel.fromMap(data);
    }).toList();
    
    print("#################################");
    print(respuesta.length);
    print(">>>>> READ ");
    print("#################################");
    return respuesta.isEmpty ? [] : respuesta;
  }

}

import 'package:logic_class_flutter/models/UserModel.dart';
import 'package:sqflite/sqflite.dart';

class HelperDB {
  static const TABLE_NAME = "usuario";

  //crear la DB
  Future<Database> db = openDatabase('registro1.db', version: 1,
      onCreate: (Database db, int i) async {
    await db.execute("""
          CREATE TABLE $TABLE_NAME(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT,
            user TEXT,
            pass TEXT,
            rating INTEGER
          );""");
  });

  Future<int> insertUser(UserModel userModel) async {
    Database db = await this.db;
    int respuesta = await db.insert(TABLE_NAME, userModel.toMap());
    print("#################################");
    print(">>>>> INSERT $respuesta");
    print("#################################");
    return respuesta;
  }

  Future<List<UserModel>> readUser() async {
    Database db = await this.db;
    List<Map<String, dynamic>> lista = await db.query(TABLE_NAME);
    final respuesta = lista.map((Map<String, dynamic> data) {
      return UserModel.fromMap(data);
    }).toList();

    print("#################################");
    print(">>>>> READ ");
    print("#################################");
    return respuesta.isEmpty ? [] : respuesta;
  }

  Future<List<UserModel>> readUserEmailPass(String email, String pass) async {
    Database db = await this.db;
    List<Map<String, dynamic>> lista = await db.query(TABLE_NAME,
        where: "email = ? and pass = ?", whereArgs: [email, pass]);      
      /*    
    try {
      List<Map<String, dynamic>> lista2 = await db.rawQuery(
          "Select * from $TABLE_NAME where email like ? and pass like ?",[email, pass]);
      final respuesta2 = lista2.map((Map<String, dynamic> data) {
        return UserModel.fromMap(data);
      }).toList();
      print("Respuesta ....... $respuesta2");
    } catch (e) {
      print(e);

    }*/

    
    final respuesta = lista.map((Map<String, dynamic> data) {
      return UserModel.fromMap(data);
    }).toList();

    print("#################################");
    print(respuesta.length);
    print(">>>>> READ user mail ");
    print("#################################");
    return respuesta.isEmpty ? [] : respuesta;
  }
  Future updateUser(UserModel u) async{
    Database db = await this.db;
    int respuesta = await db.update(TABLE_NAME, u.toMap(),where: "id = ?",whereArgs: [u.id]);
    print("#################################");
    print(">>>>> Update user $respuesta ");
    print("#################################");
  }
  //CRUD create read update delete
  Future deleteUser(UserModel u) async{
    Database db = await this.db;
    int resp = await db.delete(TABLE_NAME,where: "id = ?",whereArgs: [u.id]);
    print("#################################");
    print(">>>>> Delete user $resp ");
    print("#################################");

  }
}

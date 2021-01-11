import 'package:path_provider/path_provider.dart';
import 'package:perbaikan_nilai/perbaikan.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'dart:io' as io;
import 'dart:async';

class DBHelper {
  static final DBHelper _instance = new DBHelper.internal();
  DBHelper.internal();

  factory DBHelper() => _instance;

  static Database _db;
  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await setDB();
    return _db;
  }

  setDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "LatihansqliteDB");
    var dB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return dB;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE user(username TEXT PRIMARY KEY, password TEXT, email TEXT)");
    print("DB Created");
  }

  Future<int> saveNote(Perbaikan perbaikan) async{
    var dbClient= await db;
    int res=await dbClient.insert("user", perbaikan.toMap());
    print("data inserted");
    return res;
  }
}

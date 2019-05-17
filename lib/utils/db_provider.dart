import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_authapp/entities/user.dart';

class DBProvider{
  DBProvider._();

  static final DBProvider dbProvider = new DBProvider._internal();

  factory DBProvider() {
    return dbProvider;
  }

  DBProvider._internal();
  Database db;

  Future<Database> get database async {
    if (db != null) return db;
    db = await initDB();
    return db;
  }

  initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'default.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE ${User.tableName} ("
                  "${User.columnId} INTEGER PRIMARY KEY AUTOINCREMENT,"
                  "${User.columnEmailName} TEXT,"
                  "${User.columnTokenName} TEXT)");
        },
        onUpgrade: (Database db, int oldVersion, int newVersion) async {
//      TODO: execute migration script
        },
        onDowngrade: (Database db, int oldVersion, int newVersion) async {
//      TODO: execute migration script
        });
  }

  Future close() async => db.close();

}
import 'package:sqflite/sqflite.dart';
import 'package:firebase_authapp/entities/user.dart';
class UserModel{
  Database _db;
  UserModel(Database db) {
    _db = db;
  }
  Future<User> insert(User user) async {
    user.id = await _db.insert(User.tableName, user.toMap());
    return user;
  }
  getUserWithId(int id) async {
    var res = await _db.query(User.tableName,
        where: "${User.columnId} = ?", whereArgs: [id]);
    return res.isNotEmpty ? User.fromMap(res.first) : null;
  }

  getFirstUser() async {
    var res = await _db.query(User.tableName);
    return res.isNotEmpty ? User.fromMap(res.first) : null;
  }

  Future<int> delete(int id) async {
    try{
      return await _db.delete(User.tableName, where: '${User.columnId} = ?', whereArgs: [id]);
    }catch(error){
      print('Error in deleting user: $error');
      // ToDo: Write Log
      return 0;
    }
  }

  Future<int> getCount() async{
    return Sqflite
        .firstIntValue(await _db.rawQuery('SELECT COUNT(*) FROM ${User.tableName}'));
  }
}
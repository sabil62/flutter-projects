import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database db;

class DatabaseCreator {
  static const rollNumberTable = 'rollNo';
  static const id = 'id';
  static const name = 'name';
  static const info = 'info';
  static const isDeleted = 'isDeleted';

  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult,
      int insertAndUpdateQueryResult,
      List<dynamic> params]) {
    print(functionName);
    print(sql);
    if (params != null) {
      print(params);
    }
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<void> createTable(Database db, String tableName) async {
    final todoSql = '''CREATE TABLE $tableName
    (
      $id INTEGER PRIMARY KEY,
      $name TEXT,
      $info TEXT,
      $isDeleted BIT NOT NULL
    )''';

    await db.execute(todoSql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    //make sure the folder exists
    if (await Directory(dirname(path)).exists()) {
      //await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath('RollNumberTable'); //name of database
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    db = await openDatabase(path, version: 1, onCreate: onCreate2);

    print(db);
  }

  Future<void> onCreate(Database db, int version) async {
    await createTable(db, 'RollNumberTable');
  }

  Future<void> onCreate2(Database db, int version) async {
    await createTable(db, 'next');
  }
}

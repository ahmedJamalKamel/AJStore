import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbController {
  static final DbController _instance = DbController._internal();
  late Database _database;

  DbController._internal();

  factory DbController() {
    return _instance;
  }

  Database get database => _database;

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'app_db.sql');
    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE cities ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'nameEn TEXT NOT NULL,'
            'nameAr TEXT NOT NULL'
            ')');
        await db.execute('CREATE TABLE cart ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'nameEn TEXT NOT NULL,'
            'nameAr TEXT NOT NULL,'
            'price TEXT NOT NULL,'
            'image TEXT NOT NULL,'
            'cont INTEGER NOT NULL,'
            'prodictId INTEGER NOT NULL'
            ')');
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) {

      },
      onDowngrade: (db, oldVersion, newVersion) {},
    );
  }
}

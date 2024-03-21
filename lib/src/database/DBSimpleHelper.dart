import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/ToDoModel.dart';
import '../res/constant/app_constants.dart';


class DBSimpleRepository {
  static final DBSimpleRepository instance = DBSimpleRepository._init();

  DBSimpleRepository._init();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('todo.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path,
        version: 4, onCreate: _createDB, onUpgrade: _onUpgrade);
  }

  Future _createDB(Database db, int version) async {
    /*Table One*/
    await db.execute('''
        CREATE TABLE ${DBConst.tableName} ( 
          ${DBConst.id} INTEGER PRIMARY KEY AUTOINCREMENT, 
          ${DBConst.title} TEXT NOT NULL,
          ${DBConst.describtion} TEXT NOT NULL,
          ${DBConst.isImportant} INTEGER NOT NULL)
        ''');
/*
    */ /*Table Two*/ /*
    await db.execute('''
        CREATE TABLE ${DBConst.tableNameTwo} (
          ${DBConst.id} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${DBConst.title} TEXT NOT NULL)
        ''');*/
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 3) {
      // Perform migration from version 1 to version 2
      await db.execute(
          'ALTER TABLE ${DBConst.tableName} ADD COLUMN ${DBConst.newColumn} TEXT;');
    }
    if (oldVersion < 4) {
      // Perform migration from version 3 to version 4
      await db.execute(
        'CREATE TABLE ${DBConst.tableNameTwo} ('
        '${DBConst.id} INTEGER PRIMARY KEY AUTOINCREMENT,'
        '${DBConst.title} TEXT NOT NULL'
        ');',
      );
    }
  }

  Future<void> insert({required ToDoModel todo}) async {
    try {
      final db = await instance.database;
      await db.insert(DBConst.tableName, todo.toMap());
      print('todoAdded');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<ToDoModel> insertN({required ToDoModel todo}) async {
    try {
      final db = await instance.database;
      final id = await db.insert(DBConst.tableName, todo.toMap());
      final insertedTodo = todo.copyWith(id: id);
      print('todoAdded');
      return insertedTodo;
    } catch (e) {
      print(e.toString());
      throw e; // Optionally, you can rethrow the exception to handle it in the caller.
    }
  }

  Future<List<ToDoModel>> getAllTodos() async {
    final db = await instance.database;

    final result = await db.query(DBConst.tableName);

    return result.map((json) => ToDoModel.fromJson(json)).toList();
  }

  Future<void> delete(int id) async {
    try {
      final db = await instance.database;
      await db.delete(
        DBConst.tableName,
        where: '${DBConst.id} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> update(ToDoModel todo) async {
    try {
      final db = await instance.database;
      db.update(
        DBConst.tableName,
        todo.toMap(),
        where: '${DBConst.id} = ?',
        whereArgs: [todo.id],
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
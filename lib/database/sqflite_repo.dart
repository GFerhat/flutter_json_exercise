import 'dart:developer';

import 'package:i12_into_012/database/repo.dart';
import 'package:i12_into_012/state/todo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteRepo implements Repo {
  static final SqfliteRepo instance = SqfliteRepo.instance;

  static Database? _dbService;

  final String _tasksTableName = 'todo';
  final String _tasksIdColumnName = 'id';
  final String _tasksContentColumnName = 'content';
  final String _tasksStatusColumnName = 'status';
  final String _dbFileName = 'master_db.db';

  Future<Database> get database async {
    if (_dbService != null) return _dbService!;
    _dbService = await openTasksDatabase();
    return _dbService!;
  }

  Future<Database> openTasksDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, _dbFileName);
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, verion) async {
        await db.execute('''
          CREATE TABLE $_tasksTableName (
            $_tasksIdColumnName TEXT PRIMARY KEY,
            $_tasksContentColumnName TEXT NOT NULL,
            $_tasksStatusColumnName INTEGER NOT NULL
          )
        ''');
      },
    );
    return database;
  }

  @override
  Future<ToDo?> addToDo(
    ToDo todo,
  ) async {
    try {
      final db = await database;
      await db.insert(
        _tasksTableName,
        todo.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return todo;
    } on DatabaseException catch (e) {
      log('Esel $e');
      return null;
    }
  }

  @override
  Future<List<ToDo>?> getToDos() async {
    final List<ToDo> todos = [];
    final db = await database;
    final todoMaps = await db.query(_tasksTableName);
    for (final item in todoMaps) {
      final todo = ToDo.fromJson(item);
      todos.add(todo);
    }
    return todos;
  }

  @override
  Future<ToDo?> removeToDo(ToDo todo) async {
    try {
      final db = await database;
      await db.delete(
        _tasksTableName,
        where: 'id == ?',
        whereArgs: [todo.id],
      );
      return todo;
    } on DatabaseException catch (e) {
      log('Esel $e');
      return null;
    }
  }

  @override
  Future<ToDo?> updateToDo(ToDo todo) {
    return addToDo(todo);
  }
}

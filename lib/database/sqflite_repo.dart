import 'dart:developer';

import 'package:i12_into_012/database/repo.dart';
import 'package:i12_into_012/state/todo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SqfliteRepo implements Repo {
  static final SqfliteRepo instance = SqfliteRepo(); //.instance;

  static Database? _dbService;

  final String _taskCreatedAt = 'createdAt';
  final String _tasksTableName = 'todo';
  final String _tasksIdColumnName = 'id';
  final String _tasksContentColumnName = 'task';
  final String _tasksStatusColumnName = 'isDone';
  final String _dbFileName = 'master_db.db';

  Future<Database> get database async {
    if (_dbService != null) return _dbService!;
    _dbService = await openTasksDatabase();
    return _dbService!;
  }

  Future<Database> openTasksDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    log('openTaskDatabase');
    final databasePath = join(databaseDirPath, _dbFileName);
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tasksTableName (
            $_taskCreatedAt TEXT NO NULL,
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
      log('to json${todo.toJson()}');
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
    log('in der getToDO');

    final db = await database;
    log('in der getToDO');
    final todoMaps = await db.query(_tasksTableName);
    for (final item in todoMaps) {
      final todo = ToDo.fromJson(item);
      todos.add(todo);
    }
    log("getToDo Function");
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

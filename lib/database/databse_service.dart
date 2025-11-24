import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService isntance = DatabaseService._constructor();
  final String _tasksTableName = 'tasks';
  final String _tasksIdColumnName = 'id';
  final String _tasksContentColumn = 'content';
  final String _tasksStatusColumnName = 'status';

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await openTasksDatabase();
    return _db!;
  }

  Future<Database> openTasksDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'master_db.db');
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, verion) async {
        await db.execute('''
          $_tasksTableName (
            $_tasksIdColumnName INTEGER PRIMARY KEY,
            $_tasksContentColumn TEXT NOT NULL,
            $_tasksStatusColumnName INTEGER NOT NULL
        )
        CREATE TABLE 
        ''');
      },
    );
    return database;
  }
}

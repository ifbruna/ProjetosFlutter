import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  static const int _version = 1;
  static const String _dbName = "instagram_db.db";

  Future<Database> _initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, _dbName);
    return openDatabase(
      path,
      onCreate: _createDb,
      version: _version,
      onConfigure: _onConfig,
    );
  }

  Future _createDb(Database db, int version) async {
    await db.execute('''
    CREATE TABLE posts(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    liked INTEGER NOT NULL)''');

    await db.execute('''
    CREATE TABLE storys(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user TEXT NOT NULL,
    text TEXT NOT NULL,
    vizualizado INTEGER NOT NULL)
  ''');

    await db.execute('''
    CREATE TABLE comments(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    text TEXT NOT NULL,
    post_id INTEGER,
    FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE)''');
  }

  Future _onConfig(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }
}

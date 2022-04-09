import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'todo_models.dart';

class DatabaseConnect {
  late Database db;
  final tableName = 'todo_practice';

  Future<Database> get database async {
    final dbPath = await getDatabasesPath();
    final dbName = 'todo_practice_db.db';
    final path = join(dbPath, dbName);

    db = await openDatabase(path, version: 1, onCreate: _createDB);
    return db;
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''

    CREATE TABLE todo_practice(
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      title TEXT,
      creationDate TEXT,
      isChecked INTEGER
    )
''');
  }

  Future<void> insertTodo(TodoModel todo) async {
    //db = await database;
    final db = await database;
    try {
      await db.insert(tableName, todo.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (error) {
      print(error);
    }
  }

  Future<void> deleteTodo(TodoModel todo) async {
    //db = await database;
    final db = await database;
    await db.delete(tableName, where: 'id==?', whereArgs: [todo.id]);
  }

  Future<List<TodoModel>> getTodo() async {
    //db = await database;
    final db = await database;
    final List<Map<String, dynamic>> data =
        await db.query(tableName, orderBy: 'id DESC');

    return List.generate(data.length, (index) {
      return TodoModel(
          title: data[index]['title'],
          isChecked: data[index]['isChecked'] == 1 ? true : false,
          creationDate: DateTime.parse(data[index]['creationDate']),
          id: data[index]['id']);
    });
  }
}

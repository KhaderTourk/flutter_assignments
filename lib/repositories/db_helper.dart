import 'package:flutter_to_do/models/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();
  static DBHelper dbHelper = DBHelper._();
  static final String databaseName = "tasksDB.db";
  static final String tableName = "tasks";
  static final String taskIdColumnName = "id";
  static final String taskNameColumnName = "name";
  static final String taskIsCompletedColumnName = "isCompleted";

  Database database;

  Future<Database> createDatabase() async{
    try {
      var databasePath = await getDatabasesPath();
      String path = join( databasePath , databaseName) ;

      Database database = await openDatabase(path,version: 1,
          onCreate:(Database db, int version) async {
        await db.execute('CREATE TABLE $tableName ( '
            '$taskIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT, '
            '$taskNameColumnName TEXT NOT NULL, '
            '$taskIsCompletedColumnName INTEGER)');
      });

      print('create db');
      return database;
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<Database> initDatabase()async{
    if(database == null){
      return await createDatabase();
    }else{
      return database;
    }
  }

  insertNewTask(Task task)async{
try {
  database = await initDatabase();
  await database.insert(tableName ,task.toJson());

} on Exception catch (e) {
  print(e);
}
  }
  Future<List<Task>> returnAllTasks()async{
    try {
      database = await initDatabase();
      List<Map> result = await database.query(tableName);
      List<Task> tasks = result.map((e) => Task.fromJson(e)).toList();
      return tasks;

    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  deleteTasks()async{
    try {
      database = await initDatabase();
      database.delete(tableName);
    } on Exception catch (e) {
      print(e);
    }
  }

}


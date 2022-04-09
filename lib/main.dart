import 'package:flutter/material.dart';
import 'package:todo_practice_app/models/database_model.dart';
import 'package:todo_practice_app/models/todo_models.dart';
import 'package:todo_practice_app/todo.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = DatabaseConnect();
  await db.insertTodo(TodoModel(
      title: 'this is a sample todo',
      isChecked: false,
      creationDate: DateTime.now()));

  print(await db.getTodo());
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Todo(),
  ));
}

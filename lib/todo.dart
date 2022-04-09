import 'package:flutter/material.dart';
import 'package:todo_practice_app/models/database_model.dart';
import 'package:todo_practice_app/models/todo_models.dart';

class Todo extends StatefulWidget {
  Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO APPLICATION'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_tracker/const/datasource.dart';
import 'package:todo_tracker/model/todo_item.dart';

class AddTodoPage extends StatefulWidget {
  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController descriptionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new TODO item'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text('Description:'),
            TextField(
              controller: descriptionController,
            ),
            ElevatedButton(
              onPressed: descriptionController.text.isEmpty
                  ? null
                  : () {
                      Datasource.todoItems
                          .add(TodoItem(descriptionController.text, false));
                      descriptionController.text = '';
                      Navigator.of(context).pop();
                    },
              child: Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}

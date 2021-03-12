import 'package:flutter/material.dart';
import 'package:todo_tracker/model/todo_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoItem> todoItems = [
    TodoItem(0, 'First', true),
    TodoItem(1, 'Second', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('My TODOs'),
            IconButton(
                icon: Icon(Icons.help),
                onPressed: () {
                  Navigator.of(context).pushNamed('/about');
                }),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: todoItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                todoItems[index].description,
                style: TextStyle(
                  color: todoItems[index].done ? Colors.black : Colors.white,
                  decoration: todoItems[index].done
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
              tileColor: todoItems[index].done ? Colors.grey : Colors.blue,
              onTap: () {
                setState(() {
                  todoItems[index].done = !todoItems[index].done;
                });
              },
            );
          },
        ),
      ),
    );
  }
}

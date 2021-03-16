import 'package:flutter/material.dart';
import 'package:todo_tracker/model/todo_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoItem> todoItems = [
    TodoItem('Kupi mleko', false),
    TodoItem('Prosetaj psa', false)
  ];
  TextEditingController newTodoController = TextEditingController();

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
        child: Column(
          children: [
            TextField(
              controller: newTodoController,
              onChanged: (newText) {
                setState(() {});
              },
            ),
            ElevatedButton(
              onPressed: newTodoController.text.isEmpty
                  ? null
                  : () {
                      setState(() {
                        todoItems.add(TodoItem(newTodoController.text, false));
                        newTodoController.text = '';
                      });
                    },
              child: Text('Add TODO item'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return new AlertDialog(
                      title: new Text(
                        'Really delete all items?',
                      ),
                      actions: <Widget>[
                        new TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: new Text('Cancel')),
                        new TextButton(
                            onPressed: () {
                              setState(() {
                                todoItems.clear();
                              });
                              Navigator.of(context).pop();
                            },
                            child: new Text(
                              'Yes, delete all',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            )),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Delete all',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todoItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 1.0, 0, 0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            todoItems[index].description,
                            style: TextStyle(
                              color: todoItems[index].done
                                  ? Colors.black
                                  : Colors.white,
                              decoration: todoItems[index].done
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          tileColor:
                              todoItems[index].done ? Colors.grey : Colors.blue,
                          onTap: () {
                            setState(() {
                              todoItems[index].done = !todoItems[index].done;
                            });
                          },
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return new AlertDialog(
                                    title: new Text(
                                      'Really delete this item?',
                                    ),
                                    actions: <Widget>[
                                      new TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: new Text('Cancel')),
                                      new TextButton(
                                          onPressed: () {
                                            setState(() {
                                              todoItems.removeAt(index);
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: new Text(
                                            'Delete',
                                            style: TextStyle(
                                              color: Colors.red,
                                            ),
                                          )),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

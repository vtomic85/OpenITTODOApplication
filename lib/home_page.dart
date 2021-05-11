import 'package:flutter/material.dart';
import 'package:todo_tracker/model/todo_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoItem> todoItems = [
    TodoItem('Kupi mleko', false),
    TodoItem('Prošetaj psa', false),
    TodoItem('Prošetaj mačku', false),
    TodoItem('Seti se da zapravo nemaš mačku', false),
    TodoItem('Vrati se kući', false),
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
                      insertItem();
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
                              deleteAllItems();
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
                    child: ListTile(
                      title: Text(
                        todoItems[index].description,
                        style: TextStyle(
                          color: todoItems[index].done
                              ? Colors.white
                              : Colors.blue,
                          decoration: todoItems[index].done
                              ? TextDecoration.lineThrough
                              : null,
                          fontWeight: todoItems[index].done
                              ? FontWeight.normal
                              : FontWeight.bold,
                        ),
                      ),
                      tileColor: todoItems[index].done
                          ? Colors.grey
                          : Colors.white,
                      onTap: () {
                        updateItem(index);
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
                                        deleteSingleItem(index);
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateItem(int index) {
    setState(() {
      todoItems[index].done = !todoItems[index].done;
    });
  }

  void deleteSingleItem(int index) {
    setState(() {
      todoItems.removeAt(index);
    });
  }

  void deleteAllItems() {
    setState(() {
      todoItems.clear();
    });
  }

  void insertItem() {
    setState(() {
      todoItems.add(TodoItem(newTodoController.text, false));
      newTodoController.text = '';
    });
  }
}

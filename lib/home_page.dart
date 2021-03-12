import 'package:flutter/material.dart';
import 'package:todo_tracker/const/datasource.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/addTodo');
              },
              child: Text('Add TODO item'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Datasource.todoItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 1.0, 0, 0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            Datasource.todoItems[index].description,
                            style: TextStyle(
                              color: Datasource.todoItems[index].done
                                  ? Colors.black
                                  : Colors.white,
                              decoration: Datasource.todoItems[index].done
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          tileColor: Datasource.todoItems[index].done
                              ? Colors.grey
                              : Colors.blue,
                          onTap: () {
                            setState(() {
                              Datasource.todoItems[index].done =
                                  !Datasource.todoItems[index].done;
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
                                              Datasource.todoItems
                                                  .removeAt(index);
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

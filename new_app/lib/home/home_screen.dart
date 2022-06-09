import 'package:flutter/material.dart';
import 'package:new_app/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TODO app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: const Text('TODO'),
            actions: [
              Consumer<HomeViewModel>(
                builder: (context, model, child) => OutlinedButton(
                  onPressed: model.removeAllTodos,
                  child: Text(
                    "Delete EVERYTHING",
                  ),
                  style: OutlinedButton.styleFrom(backgroundColor: Colors.yellow),
                ),
              )
            ],
          ),
          body: Consumer<HomeViewModel>(
            builder: (context, model, child) => Column(
              children: [
                TextField(controller: model.controller),
                ElevatedButton(
                  onPressed: model.addTodo,
                  child: const Text('Add TODO item'),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: model.todoItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 1.0, 0, 0),
                          child: Row(
                            children: [
                              Text(model.todoItems[index].description),
                              OutlinedButton(
                                  onPressed: () => model
                                      .removeTodo(model.todoItems[index].id),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ))
                            ],
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

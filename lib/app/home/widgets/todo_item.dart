import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_view_model.dart';

class TodoItem extends StatelessWidget {
  final int _index;
  
  const TodoItem(this._index);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, viewModel, child) {
      return ListTile(
        title: Text(
          viewModel.todoItems[_index].description,
          style: TextStyle(
            color: viewModel.todoItems[_index].done ? Colors.white : Colors.blue,
            decoration: viewModel.todoItems[_index].done ? TextDecoration.lineThrough : null,
            fontWeight: viewModel.todoItems[_index].done ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        onTap: () {
          viewModel.updateItem(_index);
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
                    new TextButton(onPressed: () => Navigator.of(context).pop(), child: new Text('Cancel')),
                    new TextButton(
                        onPressed: () {
                          viewModel.deleteSingleItem(_index);
                          Navigator.of(context).pop();
                        },
                        child: new Text(
                          'Delete',
                        )),
                  ],
                );
              },
            );
          },
        ),
      );
    });
  }
}

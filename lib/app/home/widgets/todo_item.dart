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
          style: viewModel.todoItems[_index].done
              ? Theme.of(context).textTheme.bodyText1?.copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: Theme.of(context).disabledColor,
                  )
              : Theme.of(context).textTheme.bodyText1,
        ),
        onTap: () {
          viewModel.updateItem(_index);
        },
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Theme.of(context).errorColor,
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
                        onPressed: () => Navigator.of(context).pop(),
                        child: new Text('Cancel')),
                    new TextButton(
                        onPressed: () {
                          viewModel
                              .deleteSingleItem(viewModel.todoItems[_index].id);
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

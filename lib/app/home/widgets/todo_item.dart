import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_tracker/app/home/widgets/confirmation_dialog.dart';

import '../home_view_model.dart';

class TodoItem extends StatelessWidget {
  final int _index;

  const TodoItem(this._index);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        void deleteTodoItem() {
          viewModel.deleteSingleItem(viewModel.todoItems[_index].id);
        }

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
          trailing: Consumer<HomeViewModel>(
            builder: (context, viewModel, child) => IconButton(
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).errorColor,
              ),
              onPressed: () {
                showConfirmationDialog(
                  title: 'Are you sure you want to delete this item',
                  onConfirm: deleteTodoItem,
                  context: context,
                  confirmationButtonStyle:
                      TextStyle(color: Theme.of(context).errorColor),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

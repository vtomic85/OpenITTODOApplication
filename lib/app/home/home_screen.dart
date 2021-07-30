import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_tracker/app/home/home_view_model.dart';
import 'package:todo_tracker/app/home/widgets/confirmation_dialog.dart';
import 'package:todo_tracker/app/home/widgets/todo_item.dart';
import 'package:todo_tracker/styles/styles.dart';

class HomeScreen extends StatelessWidget {
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
            Consumer<HomeViewModel>(
              builder: (context, viewModel, child) => TextField(controller: viewModel.newTodoController),
            ),
            Consumer<HomeViewModel>(
              builder: (context, viewModel, child) => ElevatedButton(
                onPressed: viewModel.newTodoController.text.isEmpty
                    ? null
                    : () {
                        viewModel.insertItem(viewModel.newTodoController.text);
                        viewModel.newTodoController.text = '';
                      },
                child: Text('Add TODO item'),
              ),
            ),
            Consumer<HomeViewModel>(
              builder: (context, viewModel, child) => ElevatedButton(
                onPressed: () {
                  showConfirmationDialog(
                      'Are you sure you want to delete all items', viewModel.deleteAllItems, context);
                },
                child: Text(
                  'Delete all',
                  style: Styles.BUTTON,
                ),
              ),
            ),
            Expanded(
              child: Consumer<HomeViewModel>(
                builder: (context, viewModel, child) => ListView.builder(
                  itemCount: viewModel.todoItems.length,
                  itemBuilder: (context, index) {
                    return Padding(padding: const EdgeInsets.fromLTRB(0, 1.0, 0, 0), child: TodoItem(index));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

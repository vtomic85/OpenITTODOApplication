import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todo_tracker/app/home/home_view_model.dart';

class NewTodo extends StatelessWidget {
  const NewTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: Consumer<HomeViewModel>(builder: (context, viewModel, child) {
        return Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(controller: viewModel.newTodoController),
          ElevatedButton(
            onPressed: viewModel.newTodoController.text.isEmpty
                ? null
                : () {
                    viewModel.insertItem(viewModel.newTodoController.text);
                    viewModel.newTodoController.text = '';
                  },
            child: Text('Add TODO item'),
          ),
        ]);
      }),
    );
  }
}

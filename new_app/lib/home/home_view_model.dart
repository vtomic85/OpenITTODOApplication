import 'package:flutter/material.dart';
import 'package:new_app/data/todo_item/repositories/todo_repository.dart';

import '../data/todo_item/models/todo_item.dart';

class HomeViewModel with ChangeNotifier {
  final List<TodoItem> todoItems = [];

  final _todoRepository = TODORepository();

  HomeViewModel() {
    _todoRepository.init().then((_) => _todoRepository.todoItems.listen((todoItems) {
      todoItems = todoItems;
      notifyListeners();
    }));
  }
}
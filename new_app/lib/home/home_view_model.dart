import 'package:flutter/material.dart';
import 'package:new_app/data/todo_item/repositories/todo_repository.dart';

import '../data/todo_item/models/todo_item.dart';

class HomeViewModel with ChangeNotifier {
  final controller = TextEditingController();
  List<TodoItem> todoItems = [];

  final _todoRepository = TODORepository();

  HomeViewModel() {
    _todoRepository.init().then((_) => _todoRepository.todoItems.listen((todoItems) {
      this.todoItems = todoItems;
      notifyListeners();
    }));
  }

  void addTodo() {
    _todoRepository.upsertTodo(TodoItem(controller.text, false));
  }

  void removeTodo(String id) {
    _todoRepository.deleteSingleTodo(id);
  }

  void removeAllTodos() {
    _todoRepository.deleteAll();
  }
}
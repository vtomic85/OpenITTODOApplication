import 'package:flutter/material.dart';
import 'package:todo_tracker/data/model/todo_item.dart';
import 'package:todo_tracker/data/todo_items_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final todoRepository = TodoItemsRepository();

  List<TodoItem> todoItems = [];

  final TextEditingController newTodoController;

  HomeViewModel() : newTodoController = TextEditingController() {
    newTodoController.addListener(() {
      notifyListeners();
    });

    todoRepository.init().then((_) => todoRepository.todoItems.listen((todos) {
          todoItems = todos;
          notifyListeners();
        }));
  }

  void updateItem(int index) {
    //todoItems[index].done = !todoItems[index].done;
    notifyListeners();
  }

  void deleteSingleItem(String id) {
    todoRepository.deleteSingleTodo(id);
    notifyListeners();
  }

  void deleteAllItems() {
    todoRepository.deleteAll();
    notifyListeners();
  }

  void insertItem(String description) {
    todoRepository.upsertTodo(TodoItem(description, false));
    notifyListeners();
  }

  @override
  void dispose() {
    newTodoController.dispose();
    super.dispose();
  }
}

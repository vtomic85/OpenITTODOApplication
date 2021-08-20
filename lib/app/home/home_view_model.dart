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
    final todoItem = todoItems[index];
    todoItem.done = !todoItem.done;
    todoRepository.upsertTodo(todoItem);
    notifyListeners();
  }

  Future<void> deleteSingleItem(String id) async {
    await todoRepository.deleteSingleTodo(id);
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

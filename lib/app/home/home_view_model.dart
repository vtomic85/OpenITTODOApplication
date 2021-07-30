import 'package:flutter/material.dart';
import 'package:todo_tracker/model/todo_item.dart';

class HomeViewModel extends ChangeNotifier {
  List<TodoItem> todoItems = [
    TodoItem('Kupi mleko', false),
    TodoItem('Prošetaj psa', false),
    TodoItem('Prošetaj mačku', false),
    TodoItem('Seti se da zapravo nemaš mačku', false),
    TodoItem('Vrati se kući', false),
  ];

  final TextEditingController newTodoController;

  HomeViewModel() : newTodoController = TextEditingController() {
    newTodoController.addListener(() {notifyListeners();});
  }

  void updateItem(int index) {
    todoItems[index].done = !todoItems[index].done;
    notifyListeners();
  }

  void deleteSingleItem(int index) {
    todoItems.removeAt(index);
    notifyListeners();
  }

  void deleteAllItems() {
    todoItems.clear();
    notifyListeners();
  }

  void insertItem(String description) {
    todoItems.add(TodoItem(description, false));
    notifyListeners();
  }
}

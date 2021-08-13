import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:todo_tracker/data/model/todo_item.dart';
import 'package:todo_tracker/data/sembast_store.dart';

class TodoItemsRepository {
  final SembastStore _store = new SembastStore(name: 'todo');

  final _behaviorSubject = BehaviorSubject<List<TodoItem>>();

  Stream<List<TodoItem>> get todoItems => _behaviorSubject.stream;

  Future<void> init() async {
    await _store.init();

    _store.records.listen((records) {
      final todos = records.map((record) => TodoItem.fromJson(record)).toList();
      _behaviorSubject.add(todos);
    });
  }

  Future<TodoItem> upsertTodo(TodoItem todoItem) async {
    final record =
        await _store.upsert(id: todoItem.id, record: todoItem.toJson());
    return TodoItem.fromJson(record);
  }

  Future<void> deleteAll() async {
    await _store.deleteAll();
  }

  Future<void> deleteSingleTodo(String id) async {
    await _store.deleteSingleItem(id);
  }
}

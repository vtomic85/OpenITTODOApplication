import 'package:new_app/data/todo_item/models/todo_item.dart';
import 'package:new_app/data/todo_item/sembast_store.dart';
import 'package:rxdart/rxdart.dart';

class TODORepository {
  final SembastStore _store = SembastStore(name: 'todo');

  final _behaviorSubject = BehaviorSubject<List<TodoItem>>.seeded(List.generate(5, (index) => TodoItem('Todo $index', false)));

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

  Future<int> deleteAll() async {
    return await _store.deleteAll();
  }

  Future<void> deleteSingleTodo(String id) async {
    await _store.deleteSingleItem(id);
  }
}

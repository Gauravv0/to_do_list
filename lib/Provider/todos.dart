import 'package:flutter/cupertino.dart';
import '../Model/todo.dart';

class ToDosProvider extends ChangeNotifier {
  List<ToDo> _todos = [
    ToDo(
      createdTime: DateTime.now(),
      title: 'Plan A Trip',
      id: '',
    ),
    ToDo(
        createdTime: DateTime.now(),
        title: 'Buy Food',
        description: ''' -Eggs
      -Butter
      -Milk
       ''',
        id: ''),
    ToDo(createdTime: DateTime.now(), title: 'Walk The Dog', id: ''),
  ];
  List<ToDo> get todos => _todos.where((todo) => todo.isdone == false).toList();

  List<ToDo> get todosCompleted =>
      _todos.where((todo) => todo.isdone == true).toList();

  void addTodo(ToDo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(ToDo todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  bool toggleTodoStatus(ToDo todo) {
    todo.isdone = !todo.isdone;
    notifyListeners();

    return todo.isdone;
  }
}

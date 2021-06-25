import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Provider/todos.dart';
import '../Model/todo.dart';
import '../utils.dart';

class TodoWidget extends StatelessWidget {
  final ToDo todo;
  const TodoWidget({required this.todo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
      actionPane: SlidableDrawerActionPane(),
      key: Key(todo.id),
      actions: [
        IconSlideAction(
            color: Colors.red,
            caption: 'Delete',
            onTap: () => deleteTodo(context, todo),
            icon: Icons.delete),
      ],
      child: buildTodo(context));

  Widget buildTodo(BuildContext context) => Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              value: todo.isdone,
              onChanged: (_) {
                final provider =
                    Provider.of<ToDosProvider>(context, listen: false);
                final isdone = provider.toggleTodoStatus(todo);

                Utils.showSnackBar(
                  context,
                  isdone ? 'Task Completed' : 'Task Incomplete ',
                );
              },
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                    ),
                  ),
                  if (todo.description.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        todo.description,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.5,
                        ),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      );
  void deleteTodo(BuildContext context, ToDo todo) {
    final provider = Provider.of<ToDosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted The task');
  }
}

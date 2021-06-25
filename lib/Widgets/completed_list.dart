import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Provider/todos.dart';

import 'todowidget.dart';

class CompletedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ToDosProvider>(context);
    final todos = provider.todosCompleted;
    return todos.isEmpty
        ? Center(
            child: Text(
              'No Completed Tasks',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoWidget(todo: todo);
            },
            itemCount: todos.length,
            separatorBuilder: (content, index) => Container(
              height: 8,
            ),
          );
  }
}

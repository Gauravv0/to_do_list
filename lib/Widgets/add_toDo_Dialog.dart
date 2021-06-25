import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Model/todo.dart';
import 'package:to_do_list/Provider/todos.dart';
import 'package:to_do_list/Widgets/todo_form.dart';

class AddtoDoDialog extends StatefulWidget {
  const AddtoDoDialog({Key? key}) : super(key: key);

  @override
  _AddtoDoDialogState createState() => _AddtoDoDialogState();
}

class _AddtoDoDialogState extends State<AddtoDoDialog> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add To-Do',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ToDoFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onSavedTodo: addTodo,
              )
            ],
          ),
        ),
      );
  void addTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final todo = ToDo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<ToDosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}

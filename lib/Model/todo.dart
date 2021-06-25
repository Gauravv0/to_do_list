class ToDoField {
  static const createdTime = 'Created Time';
}

class ToDo {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isdone;

  ToDo({
    required this.createdTime,
    required this.title,
    this.description = '',
    required this.id,
    this.isdone = false,
  });
}

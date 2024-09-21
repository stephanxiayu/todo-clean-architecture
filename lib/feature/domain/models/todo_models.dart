class ToDoModel {
  final int id;
  final String text;
  final bool isCompleted;

  ToDoModel({required this.id, required this.text, this.isCompleted = false});

  ToDoModel toogleCompletion() {
    return ToDoModel(id: id, text: text, isCompleted: !isCompleted);
  }
}

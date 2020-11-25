import 'package:flutter/material.dart';

class TodoList {
  String activity;
  bool checkbox;

  TodoList({this.checkbox, this.activity});
  void checkboxClicked() {
    if (this.checkbox == false) {
      this.checkbox = true;
    } else {
      this.checkbox = false;
    }
  }
}

class MyState extends ChangeNotifier {
  List<TodoList> _list = [
    TodoList(checkbox: false, activity: 'Write a book'),
    TodoList(checkbox: false, activity: 'Do homework'),
    TodoList(checkbox: true, activity: 'Tidy room'),
    TodoList(checkbox: false, activity: 'Watch TV'),
    TodoList(checkbox: false, activity: 'Nap'),
    TodoList(checkbox: false, activity: 'Shop groceries'),
    TodoList(checkbox: false, activity: 'Have fun'),
    TodoList(checkbox: false, activity: 'Meditate'),
  ];

  List<TodoList> get list => _list;

  void addLines(TodoList line) {
    _list.add(line);
    notifyListeners();
  }

  void removeLines(TodoList line) {
    _list.remove(line);
    notifyListeners();
  }

  void checkboxPressed(TodoList line) {
    var idx = list.indexOf(line);
    _list[idx].checkboxClicked();
    notifyListeners();
  }
}

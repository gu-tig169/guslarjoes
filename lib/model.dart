import 'package:flutter/material.dart';
import 'package:john_tig169/API.dart';

class TodoList {
  String id;
  String activity;
  bool checkbox;

  TodoList({this.id, this.activity, this.checkbox = false});

  static Map<String, dynamic> toJson(TodoList line) {
    return {
      'title': line.activity,
      'done': line.checkbox,
    };
  }

  static TodoList fromJson(Map<String, dynamic> json) {
    return TodoList(
      id: json['id'],
      activity: json['title'],
      checkbox: json['done'],
    );
  }

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

  Future fetchList() async {
    List<TodoList> list = await Api.fetchTodos();
    _list = list;
    notifyListeners();
  }

  List<TodoList> get list => _list;

  void addLine(TodoList line) async {
    await Api.addLine(line);
    await fetchList();
  }

  void removeLine(TodoList line) async {
    await Api.removeLine(line.id);
    await fetchList();
  }

  void checkboxPressed(TodoList line, bool checkbox) async {
    line.checkbox = checkbox;
    await Api.updateLine(line, line.id);
    await fetchList();
  }
}

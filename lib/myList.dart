import 'package:flutter/material.dart';
import 'model.dart';
import 'package:provider/provider.dart';

class MyList extends StatelessWidget {
  final List<TodoList> list;
  MyList(this.list);

  Widget build(BuildContext context) {
    return ListView(
        children: list.map((line) => _myListItem(context, line)).toList());
  }
}

Widget _myListItem(context, TodoList line) {
  return CheckboxListTile(
      title: Text(line.activity,
          style: TextStyle(
              decoration: (line.checkbox
                  ? TextDecoration.lineThrough
                  : TextDecoration.none))),
      secondary: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            var state = Provider.of<MyState>(context, listen: false);
            state.removeLine(line);
          }),
      value: line.checkbox,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool value) {
        var state = Provider.of<MyState>(context, listen: false);
        state.checkboxPressed(line, value);
      });
}

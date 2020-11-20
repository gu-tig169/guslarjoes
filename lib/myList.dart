import 'package:flutter/material.dart';
import 'model.dart';
import 'package:provider/provider.dart';

class MyList extends StatelessWidget {
  final List<TodoList> list;
  MyList(this.list);

  Widget build(BuildContext context) {
    return ListView(
        children: list.map((line) => _myListitem(context, line)).toList());
  }

  Widget _myListitem(context, line) {
    return ListTile(
      leading: Checkbox(value: false, onChanged: _onChanged),
      title: Text(line.activity),
      trailing: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            var state = Provider.of<MyState>(context, listen: false);
            state.removeLines(line);
          }),
    );
  }
}

void _onChanged(bool value) {}

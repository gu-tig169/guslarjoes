import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';
import 'MyList.dart';
import 'secondView.dart';

class MainView extends StatefulWidget {
  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  var filterBy = 'All';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG169 TODO"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                filterBy = value;
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(child: Text('all'), value: 'all'),
              PopupMenuItem(child: Text('done'), value: 'done'),
              PopupMenuItem(child: Text('undone'), value: 'undone')
            ],
            icon: Icon(Icons.more_vert, size: 25, color: Colors.black),
          )
        ],
      ),
      body: Consumer<MyState>(
          builder: (context, state, child) => MyList(
                _filterList(state.list, filterBy),
              )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var newActivity = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SecondView(TodoList(activity: ''))));
          if (newActivity != null) {
            Provider.of<MyState>(context, listen: false).addLine(newActivity);
          }
        },
      ),
    );
  }
}

List<TodoList> _filterList(list, filterBy) {
  if (filterBy == 'All') return list;
  if (filterBy == 'Done')
    return list.where((item) => item.checkbox == true).toList();
  if (filterBy == 'Undone')
    return list.where((item) => item.checkbox == false).toList();
  return null;
}

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG169 TODO"),
        centerTitle: true,
        actions: [
          _popupWindow(),
        ],
      ),
      body: Consumer<MyState>(
          builder: (context, state, child) => MyList(state.list)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var newActivity = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SecondView(TodoList(
                        activity: '',
                      ))));
          if (newActivity != null) {
            Provider.of<MyState>(context, listen: false).addLines(newActivity);
          }
        },
      ),
    );
  }
}

Widget _popupWindow() {
  return PopupMenuButton<String>(
    itemBuilder: (context) => [
      PopupMenuItem(
        child: Text('All'),
      ),
      PopupMenuItem(
        child: Text('Done'),
      ),
      PopupMenuItem(
        child: Text('Undone'),
      ),
    ],
    icon: Icon(
      Icons.more_vert,
      size: 30,
      color: Colors.black,
    ),
/*      onChanged: (value) {
        setState(() {
          value = value;
        });*/
  );
}

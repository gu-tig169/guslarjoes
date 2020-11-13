import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My first app",
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("TIG169 TODO"),
          centerTitle: true,
          actions: [
            _popupWindow(),
          ],
        ),
        body: MainView(),
      ),
    );
  }
}

class MainView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: _myListView(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondView()));
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
  );
}

Widget _myListView(BuildContext context) {
  return ListView(
    children: ListTile.divideTiles(
      context: context,
      tiles: [
        ListTile(
          leading: Checkbox(value: false, onChanged: _onChanged),
          title: Text('Write a book'),
          trailing: IconButton(icon: Icon(Icons.clear), onPressed: () {}),
        ),
        ListTile(
          leading: Checkbox(value: false, onChanged: _onChanged),
          title: Text('Do homework'),
          trailing: IconButton(icon: Icon(Icons.clear), onPressed: () {}),
        ),
        ListTile(
          leading: Checkbox(value: true, onChanged: _onChanged),
          title: Text('Tidy room'),
          trailing: IconButton(icon: Icon(Icons.clear), onPressed: () {}),
        ),
        ListTile(
          leading: Checkbox(value: false, onChanged: _onChanged),
          title: Text('Watch TV'),
          trailing: IconButton(icon: Icon(Icons.clear), onPressed: () {}),
        ),
        ListTile(
          leading: Checkbox(value: false, onChanged: _onChanged),
          title: Text('Nap'),
          trailing: IconButton(icon: Icon(Icons.clear), onPressed: () {}),
        ),
        ListTile(
          leading: Checkbox(value: false, onChanged: _onChanged),
          title: Text('Shop groceries'),
          trailing: IconButton(icon: Icon(Icons.clear), onPressed: () {}),
        ),
        ListTile(
          leading: Checkbox(value: false, onChanged: _onChanged),
          title: Text('Have fun'),
          trailing: IconButton(icon: Icon(Icons.clear), onPressed: () {}),
        ),
        ListTile(
          leading: Checkbox(value: false, onChanged: _onChanged),
          title: Text('Meditate'),
          trailing: IconButton(icon: Icon(Icons.clear), onPressed: () {}),
        ),
      ],
    ).toList(),
  );
}

void _onChanged(bool value) {}

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG169 TODO"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 39,
              ),
              Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'What are you going to do?'),
                  )),
              Container(
                height: 47,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {},
                  ),
                  Container(
                      child: Text(
                    'Add',
                    style: TextStyle(fontSize: 16),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

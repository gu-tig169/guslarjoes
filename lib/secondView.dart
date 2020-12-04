import 'package:flutter/material.dart';

import 'model.dart';

class SecondView extends StatefulWidget {
  final TodoList line;

  SecondView(this.line);

  @override
  State<StatefulWidget> createState() {
    return SecondViewState(line);
  }
}

class SecondViewState extends State<SecondView> {
  String activity;
  bool checkbox;

  TextEditingController textEditingController;

  SecondViewState(TodoList line) {
    this.activity = line.activity;
    this.checkbox = line.checkbox;

    textEditingController = TextEditingController(text: line.activity);

    textEditingController.addListener(() {
      setState(() {
        activity = textEditingController.text;
      });
    });
  }

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
                    controller: textEditingController,
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
                    onPressed: () {
                      Navigator.pop(context,
                          TodoList(checkbox: false, activity: activity));
                    },
                  ),
                  Container(
                      child: Text(
                    'Add to list',
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

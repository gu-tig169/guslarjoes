import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mainView.dart';
import 'model.dart';

void main() {
  var state = MyState();
  state.fetchList();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My first app",
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MainView(),
    );
  }
}

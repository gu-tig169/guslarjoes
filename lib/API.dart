import 'dart:convert';

import 'package:http/http.dart' as http;
import 'model.dart';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = '828b66ce-9197-4e4a-8b8a-44d6f9792030';

class Api {
  static Future addLine(TodoList line) async {
    var json = jsonEncode(TodoList.toJson(line));
    await http.post('$API_URL/todos?key=$API_KEY',
        body: json, headers: {'Content-Type': 'application/json'});
  }

  static Future removeLine(String lineId) async {
    await http.delete('$API_URL/todos/$lineId?key=$API_KEY');
  }

  static Future updateLine(TodoList line, lineId) async {
    var json = jsonEncode(TodoList.toJson(line));
    await http.put('$API_URL/todos/$lineId?key=$API_KEY',
        body: json, headers: {'Content-Type': 'application/json'});
  }

  static Future<List<TodoList>> fetchTodos() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    var json = jsonDecode(response.body);

    return json.map<TodoList>((data) {
      return TodoList.fromJson(data);
    }).toList();
  }
}

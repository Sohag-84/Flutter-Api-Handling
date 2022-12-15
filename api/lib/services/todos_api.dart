import 'dart:convert';

import 'package:api/models/todos.dart';
import 'package:http/http.dart' as http;

class TodosApi {
  static List<Todo> todoList = [];
  static Future<List<Todo>> getTodosApi() async {
    http.Response response;
    response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/todos"),
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map item in data) {
        Todo todo = Todo(
          id: item['id'],
          title: item['title'],
          completed: item['completed'],
        );
        todoList.add(todo);
      }
      return todoList;
    } else {
      return todoList;
    }
  }
}

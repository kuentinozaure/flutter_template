import 'dart:convert';
import 'package:flutter_template/model/todo.dart';
import 'package:http/http.dart' as http;

String url = "https://jsonplaceholder.typicode.com/todos";


Future<List<Todo>> getTodos() async {
  final response = await http.get(url);

  if (response.statusCode == 200) {

    List<Todo> todos ;
    List jsonResponse = json.decode(response.body);
    todos = jsonResponse.map((todo) => new Todo.fromJson(todo)).toList();
    return todos;
    
  } 
  else {
    throw Exception('Failed to load album');
  }
}
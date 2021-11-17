import 'dart:convert';

import 'package:first_app/models/todo_model.dart';
import 'package:http/http.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Services {
  Future<List<Todo>> getTodos();
}

class FirebaseServices extends Services {
  @override
  Future<List<Todo>> getTodos() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('wilasinee_todos').get();

    var all = AllTodos.fromSnapshot(snapshot);

    return all.todos;
  }
}

class HttpServices extends Services {
  Client client = Client();

  Future<List<Todo>> getTodos() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to load todos');
    }

    var all = AllTodos.fromJson(json.decode(response.body));
    return all.todos;
  }
}

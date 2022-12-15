// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:api/services/todos_api.dart';
import 'package:flutter/material.dart';

class ExampleFive extends StatelessWidget {
  const ExampleFive({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos api"),
      ),
      body: FutureBuilder(
        future: TodosApi.getTodosApi(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: TodosApi.todoList.length,
              itemBuilder: (context, index) {
                var data = TodosApi.todoList[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(data.id.toString()),
                    backgroundColor:
                        data.completed ? Colors.red : Colors.orange,
                  ),
                  title: Text(data.title.toString()),
                  subtitle: Text(
                    data.completed.toString(),
                    style: TextStyle(
                      color: data.completed ? Colors.red : Colors.amber,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:api/models/comments.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleTwo extends StatelessWidget {
  ExampleTwo({Key? key}) : super(key: key);

  List<Comment> commentList = [];

  Future<List<Comment>> getCommentApi() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map item in data) {
        var comment = Comment(
          id: item['id'],
          name: item['name'],
          email: item['email'],
          body: item['body'],
        );
        commentList.add(comment);
      }
      return commentList;
    } else {
      return commentList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: FutureBuilder(
        future: getCommentApi(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: commentList.length,
              itemBuilder: (context, index) {
                var data = commentList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Id: ${data.id}",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text("name: ${data.name}",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.red)),
                      Text("email: ${data.email}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.green)),
                      Text(data.body),
                    ],
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

// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:convert';

import 'package:api/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleOne extends StatelessWidget {
  ExampleOne({Key? key}) : super(key: key);

  List<PostModel> postList = [];

  Future<List<PostModel>> getPostApi() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
      ),
      body: FutureBuilder(
        future: getPostApi(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: postList.length,
              itemBuilder: (context, index) {
                var data = postList[index];
                return ListTile(
                  leading: CircleAvatar(child: Text(data.id.toString())),
                  title: Text(
                    data.title.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(data.body.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}

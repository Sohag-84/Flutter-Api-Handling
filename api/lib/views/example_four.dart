// ignore_for_file: prefer_const_constructors

import 'package:api/models/photos.dart';
import 'package:api/services/photos_api.dart';
import 'package:flutter/material.dart';

class ExampleFour extends StatelessWidget {
  const ExampleFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Photos api")),
      body: FutureBuilder(
        future: PhotosApi.getPhotosApi(),
        builder: (context,AsyncSnapshot<List<Photos>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: PhotosApi.photoList.length,
              itemBuilder: (context, index) {
                var data = snapshot.data![index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      data.url.toString(),
                    ),
                  ),
                  title: Text(data.id.toString()),
                  subtitle: Text(data.title),
                );
              },
            );
          }
        },
      ),
    );
  }
}

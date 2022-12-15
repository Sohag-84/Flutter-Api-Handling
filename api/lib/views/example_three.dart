// ignore_for_file: prefer_const_constructors

import 'package:api/models/albums.dart';
import 'package:api/services/albums_api.dart';
import 'package:flutter/material.dart';

class ExampleThree extends StatelessWidget {
  const ExampleThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Albums"),
      ),
      body: FutureBuilder(
        future: AlbumsApi.getAlbumApi(),
        builder: (context, AsyncSnapshot<List<Albums>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: AlbumsApi.albumList.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data![index];
                  return ListTile(
                    leading: Text(data.id.toString(),style: TextStyle(fontWeight: FontWeight.w500),),
                    title: Text(data.title),
                  );
                });
          }
        },
      ),
    );
  }
}

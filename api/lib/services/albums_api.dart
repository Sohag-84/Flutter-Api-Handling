import 'dart:convert';

import 'package:api/models/albums.dart';
import 'package:http/http.dart' as http;

class AlbumsApi {
  static List<Albums> albumList = [];
  static Future<List<Albums>> getAlbumApi() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        Albums albums = Albums(id: i['id'], title: i['title']);
        albumList.add(albums);
      }
      return albumList;
    } else {
      return albumList;
    }
  }
}

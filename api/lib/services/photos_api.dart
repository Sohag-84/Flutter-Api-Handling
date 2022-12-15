import 'dart:convert';

import 'package:api/models/photos.dart';
import 'package:http/http.dart' as http;

class PhotosApi {
  static List<Photos> photoList = [];
  static Future<List<Photos>> getPhotosApi() async {
    http.Response response;
    response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(
          id: i['id'],
          title: i['title'],
          url: i['url'],
        );
        photoList.add(photos);
      }
      return photoList;
    } else {
      return photoList;
    }
  }
}

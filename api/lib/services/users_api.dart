import 'dart:convert';

import 'package:api/models/user.dart';
import 'package:http/http.dart' as http;

class UsersApi {
  static List<UserModel> userList = [];
  static Future<List<UserModel>> getUserApi() async {
    http.Response response;
    response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users#"),
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map item in data) {
        userList.add(UserModel.fromJson(item));
      }
      return userList;
    } else {
      return userList;
    }
  }
}

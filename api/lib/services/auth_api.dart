//post operation

import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class AuthApi {
  //for register
  static signup({required email, required password}) async {
    try {
      Response response =
          await post(Uri.parse("https://reqres.in/api/register"), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        log(data['token']);
        log(data['id'].toString());
        Fluttertoast.showToast(msg: "Account created successfully");
      } else {
        Fluttertoast.showToast(msg: "Failed");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
  static signin({required email, required password}) async {
    try {
      Response response =
          await post(Uri.parse("https://reqres.in/api/login"), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        log(data['token']);
        Fluttertoast.showToast(msg: "Successfully logged in");
      } else {
        Fluttertoast.showToast(msg: "Failed");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}

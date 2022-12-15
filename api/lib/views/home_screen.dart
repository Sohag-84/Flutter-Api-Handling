// ignore_for_file: prefer_const_constructors

import 'package:api/views/complex_api_screen.dart';
import 'package:api/views/example_five.dart';
import 'package:api/views/example_four.dart';
import 'package:api/views/example_one.dart';
import 'package:api/views/example_six.dart';
import 'package:api/views/example_three.dart';
import 'package:api/views/example_two.dart';
import 'package:api/views/login_screen.dart';
import 'package:api/views/signup.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  navigator({required context, required screen}) {
    return Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () =>
                  navigator(context: context, screen: ExampleOne()),
              child: Text("Post Api"),
            ),
            TextButton(
              onPressed: ()=>
                  navigator(context: context, screen: ExampleTwo()),
              child: Text("Comment Api"),
            ),
            TextButton(
              onPressed: () =>
                  navigator(context: context, screen: ExampleThree()),
              child: Text("Albums Api"),
            ),
            TextButton(
              onPressed: () =>
                  navigator(context: context, screen: ExampleFour()),
              child: Text("Photos Api"),
            ),
            TextButton(
              onPressed: () =>
                  navigator(context: context, screen: ExampleFive()),
              child: Text("Todos Api"),
            ),
            TextButton(
              onPressed: () =>
                  navigator(context: context, screen: ExampleSix()),
              child: Text("Users Api"),
            ),
            TextButton(
              onPressed: () =>
                  navigator(context: context, screen: ProductScreen()),
              child: Text("Products Api"),
            ),
            TextButton(
              onPressed: () =>
                  navigator(context: context, screen: SignupScreen()),
              child: Text("Signup Screen"),
            ),
            TextButton(
              onPressed: () =>
                  navigator(context: context, screen: SigninScreen()),
              child: Text("Sign in Screen"),
            ),
          ],
        ),
      ),
    );
  }
}

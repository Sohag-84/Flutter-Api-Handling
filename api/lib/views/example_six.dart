// ignore_for_file: prefer_const_constructors

import 'package:api/models/user.dart';
import 'package:api/services/users_api.dart';
import 'package:flutter/material.dart';

class ExampleSix extends StatelessWidget {
  const ExampleSix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Api")),
      body: FutureBuilder(
        future: UsersApi.getUserApi(),
        builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var data = snapshot.data![index];
                var addressData = data.address;
                return Container(
                  color: Colors.grey,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.orange,
                      child: Column(
                        children: [
                          ReusableRow(
                            title: "Name",
                            value: data.name.toString(),
                          ),
                          ReusableRow(
                            title: "Username",
                            value: data.username.toString(),
                          ),
                          ReusableRow(
                            title: "Email",
                            value: data.email.toString(),
                          ),
                          ReusableRow(
                            title: "Phone",
                            value: data.phone.toString(),
                          ),
                          ReusableRow(
                            title: "Website",
                            value: data.website.toString(),
                          ),
                          ReusableRow(
                            title: "City",
                            value: addressData!.city.toString(),
                          ),
                          ReusableRow(
                            title: "Website",
                            value: addressData.street.toString(),
                          ),
                          ReusableRow(
                            title: "Latitude",
                            value: addressData.geo!.lat.toString(),
                          ),
                          ReusableRow(
                            title: "Company Name: ",
                            value: data.company!.name.toString(),
                          ),
                        ],
                      ),
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

class ReusableRow extends StatelessWidget {
  final String title, value;
  const ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}

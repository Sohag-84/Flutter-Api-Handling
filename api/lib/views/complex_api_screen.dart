// ignore_for_file: prefer_const_constructors

import 'package:api/models/product_model.dart';
import 'package:api/services/products_api.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Api")),
      body: FutureBuilder(
        future: ProductsApi.getProductApi(),
        builder: (context,AsyncSnapshot<ProductModel> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var data = snapshot.data!.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data[index].products![1].images![1].url.toString()),
                  ),
                  title: Text(data[index].products![0].description.toString()),
                  subtitle: Text(data[index].products![0].colors.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}

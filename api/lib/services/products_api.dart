import 'dart:convert';

import 'package:api/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductsApi {
  static Future<ProductModel> getProductApi() async {
    http.Response response;
    response = await http.get(
      Uri.parse("https://webhook.site/ca1133f0-215b-416c-8a93-ea842e5ea6bd"),
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return ProductModel.fromJson(data);
    } else {
      return ProductModel.fromJson(data);
    }
  }
}

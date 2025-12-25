import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/api.dart';
import '../models/product_model.dart';

class ProductService {
  Future<List<Product>> getProducts() async {
    final response = await http.get(
      Uri.parse("$baseUrl/api/products"),
    );

    final List data = json.decode(response.body);
    return data.map((e) => Product.fromJson(e)).toList();
  }
}

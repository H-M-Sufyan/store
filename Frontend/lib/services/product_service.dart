import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/api.dart';
import '../models/product_model.dart';

class ProductService {
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse("$baseUrl/api/products"));

    final List data = json.decode(response.body);
    return data.map((e) => Product.fromJson(e)).toList();
  }

  Future<List<Product>> getFeaturedProducts() async {
    final response = await http.get(
      Uri.parse("$baseUrl/api/products/featured"),
    );

    final List data = jsonDecode(response.body);
    return data.map((e) => Product.fromJson(e)).toList();
  }

  Future<List<Product>> getBestSellers() async {
    final response = await http.get(
      Uri.parse("$baseUrl/api/products/best-sellers"),
    );

    final List data = jsonDecode(response.body);
    return data.map((e) => Product.fromJson(e)).toList();
  }

  Future<List<Product>> getSpecialOffers() async {
    final response = await http.get(
      Uri.parse("$baseUrl/api/products/special-offers"),
    );

    final List data = jsonDecode(response.body);
    return data.map((e) => Product.fromJson(e)).toList();
  }

  Future<List<Product>> getTopRated() async {
    final response = await http.get(
      Uri.parse("$baseUrl/api/products/top-rated"),
    );

    final List data = jsonDecode(response.body);
    return data.map((e) => Product.fromJson(e)).toList();
  }

  Future<List<Product>> getNewArrivals() async {
    final response = await http.get(
      Uri.parse("$baseUrl/api/products/new-arrivals"),
    );

    final List data = jsonDecode(response.body);
    return data.map((e) => Product.fromJson(e)).toList();
  }
}

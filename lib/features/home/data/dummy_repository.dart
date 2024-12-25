import 'package:dio/dio.dart';
import 'package:flutter_test_app/core/domain/product_model.dart';

//Repository for communicating with the server
class DummyRepository {
  DummyRepository({required this.dio});

  final Dio dio;

  //Method to get a list of products
  Future<List<ProductModel>> getProducts(
      int limit, int skip, String select) async {
    final response = await dio.get(
        'https://dummyjson.com/products?limit=$limit&skip=$skip&select=$select');
    //deserialization of past product list
    final data = response.data as Map<String, dynamic>;
    final products = data['products'] as List<dynamic>;
    final productsList = products
        .map(
          (e) => ProductModel(
            id: e['id'],
            title: e['title'],
            price: e['price'],
            description: e['description'],
            images: (e['images'] as List<dynamic>)
                .map((el) => el.toString())
                .toList(),
            thumbnail: e['thumbnail'],
          ),
        )
        .toList();
    return productsList;
  }
}

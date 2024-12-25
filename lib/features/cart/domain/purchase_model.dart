import 'package:flutter_test_app/core/domain/product_model.dart';

class PurchaseModel extends ProductModel {
  PurchaseModel(
      {this.count = 0,
      required super.id,
      required super.title,
      required super.price,
      required super.description,
      required super.images,
      required super.thumbnail});

  int count;

  factory PurchaseModel.fromProduct(ProductModel product, {int count = 0}) {
    return PurchaseModel(
      id: product.id,
      title: product.title,
      price: product.price,
      description: product.description,
      images: product.images,
      thumbnail: product.thumbnail,
      count: count,
    );
  }
}

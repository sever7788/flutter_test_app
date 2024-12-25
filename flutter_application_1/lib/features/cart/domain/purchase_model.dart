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

  plus(int num) {
    count += num;
  }

  minus(int num) {
    count -= num;
  }
}

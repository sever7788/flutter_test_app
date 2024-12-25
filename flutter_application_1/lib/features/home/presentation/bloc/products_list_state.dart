part of 'products_list_bloc.dart';

abstract class ProductsListState {}

class ProductsListInitial extends ProductsListState {}

class ProductsListLoading extends ProductsListState {}

class ProductsListLoaded extends ProductsListState {
  ProductsListLoaded({required this.productsList});

  final List<ProductModel> productsList;
}

class ProductsListFailure extends ProductsListState {
  ProductsListFailure(this.exception);
  final Object? exception;
}

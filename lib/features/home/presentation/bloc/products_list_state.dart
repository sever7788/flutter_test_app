part of 'products_list_bloc.dart';

abstract class ProductsListState {}

class ProductsListInitial extends ProductsListState {}

//this state indicates the start of loading
class ProductsListLoading extends ProductsListState {} 

//this state indicates that the download is complete
class ProductsListLoaded extends ProductsListState { 
  ProductsListLoaded({required this.productsList});

  final List<ProductModel> productsList;
}

//this state indicates an error during the loading process
class ProductsListFailure extends ProductsListState {
  ProductsListFailure(this.exception);
  final Object? exception;
}

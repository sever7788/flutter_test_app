import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/dummy_repository.dart';
import 'package:flutter_test_app/core/domain/product_model.dart';

part 'products_list_event.dart';
part 'products_list_state.dart';

//bloc to manage the state of the product list
class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  ProductsListBloc(this.dummyRepository) : super(ProductsListInitial()) {
    on<LoadProductsList>((event, emit) async {
      try {
        emit(ProductsListLoading());
        final productsList = await dummyRepository.getProducts(10, 0,
            'title,price,description,images,thumbnail'); //request for a list of products
        emit(ProductsListLoaded(productsList: productsList));
      } catch (e) {
        emit(ProductsListFailure(e));
      }
    });
  }
  final DummyRepository dummyRepository;
}

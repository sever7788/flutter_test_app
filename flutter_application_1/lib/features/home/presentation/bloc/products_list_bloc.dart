import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/core/domain/product_model.dart';
import 'package:flutter_test_app/features/home/data/dummy_repository.dart';

part 'products_list_event.dart';
part 'products_list_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  ProductsListBloc(this.dummyRepository) : super(ProductsListInitial()) {
    on<LoadProductsList>((event, emit) async {
      try {
        emit(ProductsListLoading());
        final productsList = await dummyRepository.getProducts(
            4, 0, 'title,price,description,images,thumbnail');
        emit(ProductsListLoaded(productsList: productsList));
      } catch (e) {
        emit(ProductsListFailure(e));
      }
    });
  }
  final DummyRepository dummyRepository;
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/features/cart/presentation/widgets/purchase.dart';
import 'package:flutter_test_app/features/home/presentation/bloc/products_list_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsListBloc, ProductsListState>(
      builder: (context, state) {
        if (state is ProductsListLoaded) {
          return SingleChildScrollView(
            child: Column(
                children: state.productsList.map((e) {
              return Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Purchase(product: e));
            }).toList()),
          );
        } else {
          return Container(
            color: Colors.amber,
          );
        }
      },
    );
  }
}

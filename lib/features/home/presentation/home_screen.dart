import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter_test_app/features/cart/presentation/bloc/purchases_map_bloc.dart';
import 'package:flutter_test_app/features/home/presentation/bloc/products_list_bloc.dart';
import 'package:flutter_test_app/features/home/presentation/widgets/failure_text.dart';
import 'package:flutter_test_app/features/home/presentation/widgets/product_card.dart';

//The main screen displays a list of products
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final productsListBloc = BlocProvider.of<ProductsListBloc>(context);

    return BlocBuilder<ProductsListBloc, ProductsListState>(
        builder: (context, productsState) {
      if (productsState is ProductsListLoaded) {
        final pairsCards = productsState.productsList.slices(2);
        return BlocBuilder<PurchasesMapBloc, PurchasesMapState>(
          builder: (context, purchasesState) {
            return SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 50,
                ),
                ...pairsCards.map((products) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.27,
                      child: Row( //Each line contains 2 product cards
                        children: [
                          const Spacer(
                            flex: 1,
                          ),
                          Expanded(
                              flex: 6,
                              child: ProductCard(
                                counter:
                                    purchasesState.getCounter(products[0].id),
                                product: products[0],
                              )),
                          const Spacer(
                            flex: 1,
                          ),
                          Expanded(
                              flex: 6,
                              child: ProductCard(
                                counter:
                                    purchasesState.getCounter(products[1].id),
                                product: products[1],
                              )),
                          const Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 50,
                ),
              ]),
            );
          },
        );
      }
      if (productsState is ProductsListFailure) {
        return FailureText(productsListBloc: productsListBloc);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}

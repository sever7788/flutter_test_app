import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter_test_app/core/constants/colors.dart';
import 'package:flutter_test_app/core/constants/fonts.dart';
import 'package:flutter_test_app/core/constants/texts.dart';
import 'package:flutter_test_app/features/cart/presentation/bloc/purchases_map_bloc.dart';
import 'package:flutter_test_app/features/home/presentation/bloc/products_list_bloc.dart';
import 'package:flutter_test_app/features/home/presentation/widgets/product_card.dart';

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
              child: Column(
                  children: pairsCards.map((products) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.27,
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Expanded(
                          flex: 6,
                          child: ProductCard(
                            counter: purchasesState.getCounter(products[0].id),
                            product: products[0],
                          )),
                      const Spacer(
                        flex: 1,
                      ),
                      Expanded(
                          flex: 6,
                          child: ProductCard(
                            counter: purchasesState.getCounter(products[1].id),
                            product: products[1],
                          )),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                );
              }).toList()),
            );
          },
        );
      }
      if (productsState is ProductsListFailure) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                Texts.failureTitle,
                style: TextStyles.title1.copyWith(color: CustomColors.dark),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                Texts.failureSubTitle,
                style: TextStyles.subtitle1.copyWith(
                  color: CustomColors.darkSecondColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              TextButton(
                  onPressed: () {
                    productsListBloc.add(LoadProductsList());
                  },
                  child: const Text(Texts.tryAgain))
            ],
          ),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}

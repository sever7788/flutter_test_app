import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test_app/core/constants/constants.dart';
import 'package:flutter_test_app/core/domain/product_model.dart';
import 'package:flutter_test_app/core/presentation/widgets/custom_text_button.dart';
import 'package:flutter_test_app/core/presentation/widgets/image_network.dart';
import 'package:flutter_test_app/core/presentation/widgets/products_counter.dart';
import 'package:flutter_test_app/features/cart/domain/purchase_model.dart';
import 'package:flutter_test_app/features/cart/presentation/bloc/purchases_map_bloc.dart';

//Mini product card
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.counter = 0,
    required this.product,
  });

  final int counter;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final purchasesBloc = BlocProvider.of<PurchasesMapBloc>(context);
    final PurchaseModel purchase = PurchaseModel.fromProduct(product, count: 1);

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'details',
          arguments: {'product': product}),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 20,
            child: ImageNetwork(url: product.thumbnail), //product preview
          ),
          const Spacer(flex: 1),
          Text(
            product.title,
            style: TextStyles.title2.copyWith(color: CustomColors.dark),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(flex: 1),
          Text(
            '\$${product.price}',
            style: TextStyles.subtitle2.copyWith(
              color: CustomColors.darkSecondColor,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 1),
          Expanded(
            flex: 5,
            child: AnimatedSwitcher( //depending on the value of the product counter, shows a button or a counter
              duration: const Duration(milliseconds: 250),
              child: counter == 0
                  ? CustomTextButton(
                      text: Texts.addToCart,
                      onTap: () =>
                          purchasesBloc.add(AddPurchase(purchase: purchase)),
                    )
                  : ProductsCounter(
                      counter: counter,
                      minus: () => purchasesBloc
                          .add(DecrementPurchaseCounter(id: product.id)), //decreasing product counter
                      plus: () => purchasesBloc
                          .add(IncrementPurchaseCounter(id: product.id)),//increasing the product counter
                    ),
            ),
          )
        ],
      ),
    );
  }
}

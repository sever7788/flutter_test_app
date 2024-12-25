import 'package:flutter/material.dart';

import '../bloc/purchases_map_bloc.dart';
import '../../domain/purchase_model.dart';
import '../../../../core/domain/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/core/constants/constants.dart';
import 'package:flutter_test_app/core/presentation/widgets/image_network.dart';
import 'package:flutter_test_app/core/presentation/widgets/products_counter.dart';

class Purchase extends StatelessWidget {
  const Purchase({super.key, required this.purchase});
  final PurchaseModel purchase;
  @override
  Widget build(BuildContext context) {
    final purchasesBloc = BlocProvider.of<PurchasesMapBloc>(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pushNamed(context, 'details',
          arguments: {'product': purchase as ProductModel}),
      child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 9,
            child: Row(
              children: [
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 8,
                  child: ImageNetwork(url: purchase.thumbnail),
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        purchase.title,
                        style: TextStyles.title2
                            .copyWith(color: CustomColors.dark),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '\$${purchase.price}',
                        style: TextStyles.subtitle2.copyWith(
                          color: CustomColors.darkSecondColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 12,
                  child: ProductsCounter(
                    counter: purchase.count,
                    minus: () => purchasesBloc
                        .add(DecrementPurchaseCounter(id: purchase.id)),
                    plus: () => purchasesBloc
                        .add(IncrementPurchaseCounter(id: purchase.id)),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}

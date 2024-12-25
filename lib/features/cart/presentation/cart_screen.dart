import 'package:flutter/material.dart';

import 'widgets/purchase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/features/cart/presentation/bloc/purchases_map_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchasesMapBloc, PurchasesMapState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
              children: state.purchasesMap.values.map((purchase) {
            return SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Purchase(purchase: purchase));
          }).toList()),
        );
      },
    );
  }
}

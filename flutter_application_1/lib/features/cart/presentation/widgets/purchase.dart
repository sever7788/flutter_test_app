import 'package:flutter/material.dart';
import 'package:flutter_test_app/core/constants/colors.dart';
import 'package:flutter_test_app/core/constants/fonts.dart';
import 'package:flutter_test_app/core/domain/product_model.dart';
import 'package:flutter_test_app/core/presentation/widgets/products_counter.dart';

class Purchase extends StatelessWidget {
  const Purchase({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Column(
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
                child: Image.asset('assets/lion.png'),
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
                      product.title,
                      style:
                          TextStyles.title2.copyWith(color: CustomColors.dark),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '\$${product.price}',
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
                  counter: 0,
                  minus: () {},
                  plus: () {},
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
    );
  }
}

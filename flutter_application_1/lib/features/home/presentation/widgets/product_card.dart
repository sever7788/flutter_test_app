import 'package:flutter/material.dart';
import 'package:flutter_test_app/core/constants/colors.dart';
import 'package:flutter_test_app/core/constants/fonts.dart';
import 'package:flutter_test_app/core/constants/texts.dart';
import 'package:flutter_test_app/core/domain/product_model.dart';
import 'package:flutter_test_app/core/presentation/widgets/custom_text_button.dart';
import 'package:flutter_test_app/core/presentation/widgets/products_counter.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    super.key,
    this.counter = 0,
    required this.product,
  });

  late int counter;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'details'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 20,
            child: Image.network(
              product.images[0],
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              fit: BoxFit.contain,
            ),
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
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: counter == 0
                ? Expanded(
                    flex: 5,
                    child: CustomTextButton(
                      text: Texts.addToCart,
                      onTap: () {},
                    ),
                  )
                : Expanded(
                    flex: 5,
                    child: ProductsCounter(
                      counter: counter,
                      minus: () {},
                      plus: () {},
                    )),
          )
        ],
      ),
    );
  }
}

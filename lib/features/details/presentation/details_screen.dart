import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/core/constants/constants.dart';
import 'package:flutter_test_app/core/domain/product_model.dart';
import 'package:flutter_test_app/core/presentation/bottombar.dart';
import 'package:flutter_test_app/features/cart/domain/purchase_model.dart';
import 'package:flutter_test_app/core/presentation/widgets/image_network.dart';
import 'package:flutter_test_app/core/presentation/widgets/circle_back_button.dart';
import 'package:flutter_test_app/core/presentation/widgets/custom_text_button.dart';
import 'package:flutter_test_app/features/cart/presentation/bloc/purchases_map_bloc.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final purchasesBloc = BlocProvider.of<PurchasesMapBloc>(context);
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final ProductModel product = arguments['product'];
    final PurchaseModel newPurchase =
        PurchaseModel.fromProduct(product, count: 1);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: CircleBackButton(
            onTap: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: PageView(
              controller: PageController(),
              children:
                  product.images.map((url) => ImageNetwork(url: url)).toList(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.title,
                    style: TextStyles.title1
                        .copyWith(color: CustomColors.darkAccentColor),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.description,
                    style: TextStyles.subtitle1.copyWith(
                      color: CustomColors.darkSecondColor,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    '\$${product.price}',
                    style: TextStyles.title1.copyWith(
                      color: CustomColors.darkAccentColor,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomSheet: BlocBuilder<PurchasesMapBloc, PurchasesMapState>(
          builder: (context, state) {
        PurchaseModel? purchase = state.purchasesMap[product.id];

        return BottomBar(
          child: SizedBox(
            width: double.infinity,
            child: FractionallySizedBox(
                widthFactor: 0.8,
                heightFactor: 0.7,
                child: CustomTextButton(
                    enabled: purchase == null,
                    text: Texts.addToCart,
                    onTap: () =>
                        purchasesBloc.add(AddPurchase(purchase: newPurchase)))),
          ),
        );
      }),
    );
  }
}

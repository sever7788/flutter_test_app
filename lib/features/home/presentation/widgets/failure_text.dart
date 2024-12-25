import 'package:flutter/material.dart';

import 'package:flutter_test_app/core/constants/constants.dart';
import 'package:flutter_test_app/features/home/presentation/bloc/products_list_bloc.dart';

//Widget with information in case of error
class FailureText extends StatelessWidget {
  const FailureText({
    super.key,
    required this.productsListBloc,
  });

  final ProductsListBloc productsListBloc;

  @override
  Widget build(BuildContext context) {
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
  }
}

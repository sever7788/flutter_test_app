import 'package:flutter/material.dart';

import 'custom_text_button.dart';
import 'package:flutter_test_app/core/constants/constants.dart';

//The widget shows the quantity of the selected product and
// contains 2 buttons for changing the counter
class ProductsCounter extends StatelessWidget {
  ProductsCounter(
      {super.key,
      required this.counter,
      required this.minus,
      required this.plus});

  int counter;
  Function() minus;
  Function() plus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(flex: 2),
        Expanded(
          flex: 6,
          child: AspectRatio(
            aspectRatio: 1,
            child: CustomTextButton(
              text: '+',
              onTap: plus,
            ),
          ),
        ),
        const Spacer(flex: 2),
        Expanded(
          flex: 6,
          child: Center(
            child: Text(counter.toString(),
                style: TextStyles.title2.copyWith(color: CustomColors.dark)),
          ),
        ),
        const Spacer(flex: 2),
        Expanded(
          flex: 6,
          child: AspectRatio(
            aspectRatio: 1,
            child: CustomTextButton(
              text: '-',
              onTap: minus,
            ),
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}

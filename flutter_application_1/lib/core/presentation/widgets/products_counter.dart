import 'package:flutter/material.dart';
import 'package:flutter_test_app/core/constants/colors.dart';
import 'package:flutter_test_app/core/constants/fonts.dart';
import 'package:flutter_test_app/core/presentation/widgets/custom_text_button.dart';

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
              onTap: () => plus,
            ),
          ),
        ),
        const Spacer(flex: 3),
        Expanded(
          flex: 4,
          child: Center(
            child: Text(counter.toString(),
                style: TextStyles.title2.copyWith(color: CustomColors.dark)),
          ),
        ),
        const Spacer(flex: 3),
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

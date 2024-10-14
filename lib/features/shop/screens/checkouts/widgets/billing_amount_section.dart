import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tutorials', style: Theme.of(context).textTheme.bodyMedium),
            Text('12.000 \đ', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        ///shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('3.000 \đ', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('5.000 \đ', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order totals', style: Theme.of(context).textTheme.bodyMedium),
            Text('7.000 \đ', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
      ],
    );
  }
}

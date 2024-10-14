
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/screens/checkouts/checkout.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TButtonCheckout extends StatelessWidget {
  const TButtonCheckout({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ElevatedButton(
  onPressed: () => 
        Get.to(() => const CheckoutScreen()
        ),
        style: ElevatedButton.styleFrom(
         
          backgroundColor: TColors.primary,
          padding: const EdgeInsets.symmetric(vertical: TSizes.sm),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(TSizes.md),topRight: Radius.circular(TSizes.md)),
          ),
        ),
        child:  Text(text),
      ),
    );
  }
}
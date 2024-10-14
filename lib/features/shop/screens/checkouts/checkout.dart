import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/products/cart/coupon_code.dart';
import 'package:t_store/common/widgets/success_screen.dart/success_screen.dart';
import 'package:t_store/features/shop/screens/carts/widgets/cart_items.dart';
import 'package:t_store/features/shop/screens/checkouts/widgets/billing_adress_section.dart';
import 'package:t_store/features/shop/screens/checkouts/widgets/billing_amount_section.dart';
import 'package:t_store/features/shop/screens/checkouts/widgets/billing_payment_section.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //item in cart
              TCartItems(
                showAddRemoveButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //counpon textField
              TCouponCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              ////billing section
              TRoundedContainer(
                showBorder: true,
                backgroundColor: dark ? TColors.dark : Colors.white,
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    ///pricing

                    const BillingAmountSection(),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),

                    ///divider
                    const Divider(),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),

                    ///payment method
                    const BillingPaymentSection(),

                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),

                    ///address
                    const BillingAdressSection(),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                     
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: TImages.successfulPaymentIcon,
              title: 'Payment Success!',
              subtitle: 'Your item will be shipped soon!',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            ),
          ),
          child: const Text('Checkout (\$256.0)'),
        ),
      ),
    );
  }
}

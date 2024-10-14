import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/common/widgets/product.carts/product_price.dart';
import 'package:t_store/common/widgets/products/cart/cart_item.dart';
import 'package:t_store/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/features/shop/screens/carts/widgets/cart_quantity_and_removed.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) => TRoundedContainer(
              width: double.infinity,
              radius: TSizes.borderRadiusMd,
              padding: const EdgeInsets.all(TSizes.md),
              showBorder: true,
              backgroundColor: Colors.transparent,
              borderColor: dark ? TColors.darkGrey : TColors.grey,
              child: Column(
                children: [
                  const TCartItem(),
                if(showAddRemoveButton)  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                if(showAddRemoveButton)  const  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          TCartQtyAndRemove(),
                        ],
                      ),
                      const TProductPriceText(price: '12.000 đ'),
                    ],
                  ),
                ],
              ),
            ),
        separatorBuilder: (_, __) => const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
        itemCount: 4);
  }
}


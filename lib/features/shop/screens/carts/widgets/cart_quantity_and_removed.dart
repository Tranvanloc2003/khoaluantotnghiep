import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCartQtyAndRemove extends StatelessWidget {
  const TCartQtyAndRemove({
    super.key,

  });

 

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        TCircularIcon(
        // margin: 72,
       icon: Iconsax.minus,
       backgroundColor: dark ? TColors.light : TColors.darkGrey,
       width: 32,
       height: 32,
       size: TSizes.md,
       color: dark ? TColors.darkerGrey : TColors.light,
     ),
     const SizedBox(
       width: TSizes.sm,
     ),
     Text(
       '1',
       style: Theme.of(context).textTheme.titleSmall,
     ),
     const SizedBox(
       width: TSizes.sm,
     ),
     TCircularIcon(
       icon: Iconsax.add,
       backgroundColor: TColors.primary,
       width: 32,
       height: 32,
       size: TSizes.md,
      color: dark ? TColors.darkerGrey : TColors.light,
     ),
      ],
    );
  }
}

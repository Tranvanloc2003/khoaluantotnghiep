import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace,
        vertical: TSizes.defaultSpace /2,
      ),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
         borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),         
        
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      TCircularIcon(icon: Iconsax.minus, backgroundColor: dark ? TColors.light : TColors.darkGrey , width: 40,height: 40, color: dark ? TColors.darkerGrey : TColors.light,),
      const SizedBox(width: TSizes.sm ,),
      Text('1', style: Theme.of(context).textTheme.titleSmall,),
      const SizedBox(width: TSizes.sm,),
      TCircularIcon(icon: Iconsax.add, backgroundColor: dark ? TColors.light : TColors.darkGrey , width: 40,height: 40, color: dark ? TColors.darkerGrey : TColors.light,),
      ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: TColors.black,
          side: BorderSide(
            color: TColors.black.withOpacity(.1),
          ),
        ),
        child: const Text('Add to cart',),
      ),
      

    ],),
    );
  }
}
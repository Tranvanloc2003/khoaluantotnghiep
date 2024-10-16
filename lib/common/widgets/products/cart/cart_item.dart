import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        //image
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor:
              dark ? TColors.darkGrey : TColors.light,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        //title, price & size
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const TBrandTitleWithVerifiedIcon(
                title: 'Nike',
              ),
              const Flexible(
                child: TProductTitleText(
                  title:
                      'Air Max 270 11111111111111111111111111111',
                  maxLines: 1,
                ),
              ),
              //attribute
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Color: ',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall),
                    TextSpan(
                        text: 'Green',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge),
                    TextSpan(
                        text: ' Size: ',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall),
                    TextSpan(
                        text: 'UK 88',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge),
                  ],
                ),
              ),
              //qty
            ],
          ),
        ),
      ],
    );
  }
}

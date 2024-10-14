import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/chips/choice_chip.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductAttribute extends StatelessWidget {
  const TProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const TSectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(title: "Price : ", smallSize: true),
                          Text(
                            " \$250",
                            style:
                                Theme.of(context).textTheme.titleSmall!.apply(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          const TProductTitleText(
                            title: "175",
                            smallSize: true,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitleText(title: "Stock : ", smallSize: true),
                          Text("In Stock",
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const TProductTitleText(
                title:
                    "This Is The Description Of The Product And MaxLines Up To Max 4 Lines.",
                maxLines: 4,
                smallSize: true,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              showActionButton: false,
              title: "Colors",
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: "Blue",
                  selected: true,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: "Yellow",
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: "Black",
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: "White",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              showActionButton: false,
              title: "Sizes",
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: "EU 34",
                  selected: true,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: "EU 35",
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: "EU 36",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: const Text('Checkout')),),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            const TSectionHeading(title: 'Description', showActionButton: false),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            const ReadMoreText('Trải nghiệm âm nhạc không giới hạn với Tai Nghe Không Dây XPro 300 – thiết kế thời thượng và chất âm hoàn hảo. Với công nghệ Bluetooth 5.2, bạn có thể dễ dàng kết nối nhanh chóng, ổn định và tiết kiệm năng lượng.',
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Xem thêm',
            trimExpandedText: 'Thu gọn',
            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
            lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
            ),
             const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            
          ],
        ),
      ],
    );
  }
}

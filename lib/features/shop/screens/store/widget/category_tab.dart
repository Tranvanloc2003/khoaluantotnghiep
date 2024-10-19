import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brands/brand_show_case.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_carts/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/models/category_models.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});
final CategoryModels category;
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                //--Brands
                const TBrandShowcase(
                  images: [
                    TImages.productImage1,
                    TImages.productImage5,
                    TImages.productImage6,
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                //--Products
                TSectionHeading(
                  title: 'You might like',
                  onPressed: () {},
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                TGridLayout(
                  itemCount: 4,
                  // mainAxisExtent: 200, // Hoặc một giá trị thích hợp với kích thước card

                  itemBuilder: (_, index) => const TProductCardVertical(),
                ),
              ],
            ),
          ),
        ]);
  }
}

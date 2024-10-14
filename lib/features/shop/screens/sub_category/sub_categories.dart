import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/common/widgets/products/product_carts/product_card_horizontal.dart';
import 'package:t_store/common/widgets/products/product_carts/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Sport'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //banner
              TRoundedImage(
                width: double.infinity,
                imageUrl: TImages.promoBanner2,
                applyImageRadius: true,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
//sub category
              TSectionHeading(
                title: 'Sport shirts',
                onPressed: () {},
              ),
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              SizedBox(
                height: 120,
                child: ListView.separated(itemBuilder: (_,index) => ProductCardHorizontal(), separatorBuilder: (__,_) => const SizedBox(width: TSizes.spaceBtwItems,), itemCount: 10,scrollDirection: Axis.horizontal,shrinkWrap: true,)),
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

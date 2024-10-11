import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:t_store/common/widgets/icons/circular_icon.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/common/widgets/products/cart/bottom_add_to_card.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_attribute.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      //appbar
      appBar: TAppBar(
        actions: [
          TCircularIcon(
            icon: Iconsax.heart5,
            onPressed: () {},
            color: Colors.red,
          ),
        ],
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            //Product image slider
            TProductImageSlider(),
            //Product details
            Padding(
              padding: EdgeInsets.only(
                  right: TSizes.defaultSpace, left: TSizes.defaultSpace),
              child: Column(

                children: [
                  //rating & share
                  TRatingAndShare(),
                  //prices, title, stack,brands
                  TProductMetaData(),
                  //actributes
             TProductAttribute(),
                  //checkout

                  //description

                  //reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


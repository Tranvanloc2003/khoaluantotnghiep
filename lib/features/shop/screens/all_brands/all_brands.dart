import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brands/brand_cart.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/sortable_product/sortable_product.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/all_brands/brand_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('All Brands',),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            //headingtext
            TSectionHeading(
              title: 'Brands',showActionButton: false,
            ),
            SizedBox(height: TSizes.spaceBtwItems,),
            //brands
            TGridLayout(itemCount: 8,mainAxisExtent: 80, itemBuilder: (_,index) => TBrandCard(showBorder: true,onTap: () => Get.to(() => BrandProducts(),),),),
          ],),
        ),
      ),
    );
  }
}
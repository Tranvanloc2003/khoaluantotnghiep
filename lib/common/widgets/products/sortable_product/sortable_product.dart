import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_carts/product_card_vertical.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSortableProduct extends StatelessWidget {
  const TSortableProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //dropdown
    
      DropdownButtonFormField(
        decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        items: ['Name', 'Higher Price','Lower Price','Sale','Newest','Popularity'].map((option) => DropdownMenuItem(value: option,child: Text(option),),).toList(),onChanged: (value){
      },),
      SizedBox(height: TSizes.spaceBtwSections,),
      TGridLayout(itemCount: 10, itemBuilder: (_,index) => TProductCardVertical(),),
    ],);
  }
}

import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: isDark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            const SizedBox(
              height: 400,
              child: Padding(
                padding:
                    EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(TImages.productImage1),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics:  const AlwaysScrollableScrollPhysics(),
                itemCount: 6, separatorBuilder: (_,__) => const SizedBox(width: TSizes.spaceBtwItems,),itemBuilder: (_,index) =>TRoundedImage(imageUrl: TImages.productImage1,
                  backgroundColor: isDark ? TColors.light : TColors.darkerGrey,
                  border: Border.all(color: isDark ? TColors.darkerGrey : TColors.light),
                  padding: const EdgeInsets.all(1),
                  width: 80,
                  ),
                   
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

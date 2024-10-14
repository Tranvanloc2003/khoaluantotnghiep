import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
       final dark = THelperFunctions.isDarkMode(context);
    return Column(children: [
      TSectionHeading(title: 'Payment Methods', buttonTitle: 'Change',onPressed: (){},),
      const SizedBox(height: TSizes.spaceBtwItems / 2),
      Row(children: [TRoundedContainer(
        height: 35,
        width: 60,
        backgroundColor: dark ? TColors.light : TColors.white,
        padding: EdgeInsets.all(TSizes.sm),
        child: Image(image: AssetImage(TImages.paypal, ),fit: BoxFit.contain,),
        
      ),
      SizedBox(width: TSizes.spaceBtwItems /2,),
      Text('Paypal', style: Theme.of(context).textTheme.bodyLarge,
      ),
      ],),
    ],);
    
  }
}
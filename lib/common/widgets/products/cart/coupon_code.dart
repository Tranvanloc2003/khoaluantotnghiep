import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : Colors.white,
      padding: EdgeInsets.only(
          top: TSizes.sm,
          bottom: TSizes.sm,
          right: TSizes.sm,
          left: TSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Enter your coupon code',
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none),
            ),
          ),
          //button
          SizedBox(height: 80,
          
          child: ElevatedButton(onPressed: (){}, child: const Text('Apply'),
          style: ElevatedButton.styleFrom(
            foregroundColor: dark ? TColors.light.withOpacity(.5) : TColors.dark.withOpacity(.5),
            backgroundColor: Colors.grey.withOpacity(.2),
            side: BorderSide(color: TColors.dark.withOpacity(.5),),
          
          ),
          ),),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
       itemBuilder:  (_,index) => TRoundedContainer(
          showBorder: true,
          padding: EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkGrey : TColors.light,
          child: Column(
            children: [
              Row(
                children: [
        //icon
                  Icon(Iconsax.ship),
                  SizedBox(
                    width: TSizes.spaceBtwItems / 2,
                  ),
        
        //statuc & date
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Proccesing',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: TColors.primary, fontWeightDelta: 1),
                        ),
                        Text(
                          '12/12/1221',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                  //icon
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Iconsax.arrow_right_34,
                      size: TSizes.iconSm,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              //row 2
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        //icon
                        Icon(Iconsax.tag),
                        SizedBox(
                          width: TSizes.spaceBtwItems / 2,
                        ),
                    
                        //status & date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order',
                                style: Theme.of(context).textTheme.bodyLarge!.apply(
                                    color: TColors.primary, fontWeightDelta: 1),
                              ),
                              Text(
                                '#12345',
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                    //icon
                        Icon(Iconsax.calendar),
                        SizedBox(
                          width: TSizes.spaceBtwItems / 2,
                        ),
                    
                    //status & date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shipping Date',
                                style: Theme.of(context).textTheme.bodyLarge!.apply(
                                    color: TColors.primary, fontWeightDelta: 1),
                              ),
                              Text(
                                '12/12/1212',
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ), itemCount: 10, separatorBuilder: (__,_) => const SizedBox(height: TSizes.spaceBtwItems),
      ),
    );
  }
}

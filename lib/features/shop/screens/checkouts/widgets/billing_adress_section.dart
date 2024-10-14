import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class BillingAdressSection extends StatelessWidget {
  const BillingAdressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text(
          'TranVanLoc',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          width: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            Icon(
              Icons.phone,
              color: Colors.grey,
              size: 16,
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '0123456789',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(
          width: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            Icon(
              Icons.location_history,
              color: Colors.grey,
              size: 16,
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Expanded(
                child: Text(
              '38 Tran Quang Dieu, Phu Bai, Thua Thien Hue',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            )),
          ],
        ),
      ],
    );
  }
}

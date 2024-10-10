import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Expanded(
          child: Text.rich(
            softWrap:
                true, // Cho phép tự động xuống dòng khi quá dài
            overflow: TextOverflow
                .visible, // Cho phép hiển thị đầy đủ văn bản, không bị cắt bớt
            TextSpan(
              children: [
                TextSpan(
                    text: "${TTexts.iAgreeTo} ",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall),
                TextSpan(
                  text: "${TTexts.privacyPolicy} ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                          decoration:
                              TextDecoration.underline,
                          decorationColor:
                              THelperFunctions.isDarkMode(
                                      context)
                                  ? TColors.white
                                  : TColors.primary,
                          color:
                              THelperFunctions.isDarkMode(
                                      context)
                                  ? TColors.white
                                  : TColors.primary),
                ),
                TextSpan(
                  text: "${TTexts.and} ",
                  style:
                      Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: "${TTexts.termsOfUse} ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                          decoration:
                              TextDecoration.underline,
                          decorationColor:
                              THelperFunctions.isDarkMode(
                                      context)
                                  ? TColors.white
                                  : TColors.primary,
                          color:
                              THelperFunctions.isDarkMode(
                                      context)
                                  ? TColors.white
                                  : TColors.primary),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

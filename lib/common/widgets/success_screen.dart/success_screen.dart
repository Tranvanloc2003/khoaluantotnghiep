import 'package:flutter/material.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.title, required this.subtitle,  required this.onPressed, required this.image});
 final String title,subtitle, image;
 final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body:SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight * 2,
          child: Column(children: [
            //TImages.staticSuccessIllustration
            //logo
              Image(
                image:  AssetImage(image),
                width: THelperFunctions.screenWidth(context) * 0.6,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //title
              Text(
                // TTexts.yourAccountCreatedTitle,
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              
              //subtitle
              Text(
                // TTexts.yourAccountCreatedSubTitle,
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //button
               //button verify
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  // () => Get.to( () => const LoginScreen(), ),
                  child: const Text(TTexts.tContinue),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
          ],),
        ),
      ) ,
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      actions: [
      IconButton(onPressed: ()=> Get.back(),icon: const Icon(CupertinoIcons.clear),),
    ],),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(children: [
          //image and width 60% of screen
           Image(image: const AssetImage(TImages.deliveredEmailIllustration),
                 width: THelperFunctions.screenWidth(context) * 0.6,
               ),
          const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //title
              Text(
                // TTexts.yourAccountCreatedTitle,
                TTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              
              //subtitle
              Text(
                // TTexts.yourAccountCreatedSubTitle,
                TTexts.changeYourPasswordSubTitle,
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
                  onPressed: 
                  () => Get.to( () => const LoginScreen(), ),
                  child: const Text(TTexts.done),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
               SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: 
                  (){},
                  child: const Text(TTexts.resendEmail),
                ),
              ),
        ],),
      ),
    ),
    );
  }
}
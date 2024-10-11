import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/term_condition_checkboxs.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: TTexts.firstName,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwInputFields,
                  ),
                  Expanded(
                    child: TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: TTexts.lastName,
                      ),
                    ),
                  ),
                ],
              ),

              //username
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),

              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user_edit),
                    labelText: TTexts.username),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              //email
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              //phone number
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Iconsax.call,
                  ),
                  labelText: TTexts.phoneNo,
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              //password
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Iconsax.password_check,
                  ),
                  labelText: TTexts.password,
                  suffixIcon: Icon(Iconsax.eye_slash),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              const TTermsAndConditionCheckbox(),
            ],
          )
        ],
      ),
    );
  }
}

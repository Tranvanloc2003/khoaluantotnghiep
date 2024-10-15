import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/term_condition_checkboxs.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormkey,
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.firstname,// gans bien cho input
                      validator: (value) => TValidator.validateEmptyText('First name', value),// get phuong thuc thong bao loi
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
                      controller: controller.lastName,
                      validator: (value) => TValidator.validateEmptyText('Last name', value),// get phuong thuc thong bao loi
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
                controller: controller.username,
                validator: (value) => TValidator.validateEmptyText('Username', value),// get phuong thuc thong bao loi
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user_edit),
                    labelText: TTexts.username),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              //email
              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),// get phuong thuc thong bao loi
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              //phone number
              TextFormField(
                controller: controller.phoneNumber,
                validator: (value) => TValidator.validatePhoneNumber(value),// get phuong thuc thong bao loi
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
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),// get phuong thuc thong bao loi
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
               const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              //button create
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // onPressed: () => Get.to(
                  //   () => const VerifyEmailScreen(),
                  // ),
                  onPressed: controller.signup,
                  child: const Text(TTexts.createAccount),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:t_store/common/styles/spacing_styles.dart';

import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/common/widgets/login_signup/form_devider.dart';
import 'package:t_store/common/widgets/login_signup/social_buttons.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_header.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyles.paddingWithAppBarHeight,
            child:  Column(
              children: [
                //logo , title, subtitle
                TLoginHeader(),
                //form
                TLoginForm(),
                //divider
                TFormDivider(dividerText: TTexts.orSignInWith,),
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                //footer
                TSocialButtons(),
              ],

            ),
          ),
        ),
      ),
    );
  }
}








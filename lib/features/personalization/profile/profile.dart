import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: const TAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      //body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                      image: TImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              ProfileMenu(
                title: 'Name',
                value: 'TranVanLoc',
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              ProfileMenu(
                title: 'Username',
                value: 'vanloc',
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              ProfileMenu(
                title: 'User Id',
                value: '123',
                onPressed: () {},
                icon: Iconsax.copy,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              ProfileMenu(
                title: 'Email',
                value: 'namlun12333@gmail.com',
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              ProfileMenu(
                title: 'Phone',
                value: '0123456789',
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              ProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              ProfileMenu(
                title: 'Date of Birth',
                value: '03/04/2003',
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Divider(),
               const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Close Account',style: TextStyle(color: Colors.red),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

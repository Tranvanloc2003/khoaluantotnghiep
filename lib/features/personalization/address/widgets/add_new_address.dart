import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Add new address'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            child: Column(children: [
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.mobile),
                  labelText: 'Phone Number',
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.location),
                  labelText: 'Address',
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
Row(children: [
  Expanded(
    flex: 1,
    child: TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Iconsax.building_31),
        labelText: 'Street',
      ),
    ),
  ),
  const SizedBox(width: TSizes.spaceBtwInputFields),
  Expanded(
    flex: 1,
    child: TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Iconsax.code),
        labelText: 'Postal Code',
      ),
    ),
  ),
],),
    const SizedBox(height: TSizes.spaceBtwInputFields),
    Row(children: [
  Expanded(
    flex: 1,
    child: TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Iconsax.building),
        labelText: 'City',
      ),
    ),
  ),
  const SizedBox(width: TSizes.spaceBtwInputFields),
  Expanded(
    flex: 1,
    child: TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Iconsax.activity),
        labelText: 'Store',
      ),
    ),
  ),
],),
const SizedBox(height: TSizes.spaceBtwInputFields),
 TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.global),
                  labelText: 'Country',
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Save'),
                ),
              )
            ],),
          ),
        ),
      ),
    );
  }
}
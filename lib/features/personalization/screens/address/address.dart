import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/screens/address/widgets/add_new_address.dart';
import 'package:t_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: TAppBar(
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
     ),
     floatingActionButton: FloatingActionButton(onPressed: () => Get.to(() => const AddNewAddress()),
     child: const Icon(Iconsax.add,color:  TColors.white),
     ),
     body: const SingleChildScrollView(
      child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
      child: Column(children: [
       SingleAddress(selectedAddress: true),
        SingleAddress(selectedAddress: false),
      ],),
      ),
      
     ),
    );
   
  }
}
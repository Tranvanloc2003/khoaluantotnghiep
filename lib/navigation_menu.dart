import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/features/shop/screens/profile/profile.dart';
import 'package:t_store/features/shop/screens/store/store.dart';
import 'package:t_store/features/shop/screens/wishlist/wishlist.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(() =>
         NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value, //chi muc tro trog navigation,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations:const [
          NavigationDestination(
            icon: Icon(Iconsax.home),
            label: 'Home',
            
          ),
         
        NavigationDestination(
            icon: Icon(Iconsax.shop),
            label: 'Store',
            
          ),
          NavigationDestination(
            icon: Icon(Iconsax.heart),
            label: 'Wishlist',
            
          ),
         NavigationDestination(
            icon: Icon(Iconsax.user),
            label: 'Profile',
            
          ),
         
         
        ],),
      ),
      body: Obx( ()=> controller.screens[controller.selectedIndex.value],),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [const HomeScreen(),const StoreScreen(),const FavouriteScreen(),const ProfileScreen()];
}
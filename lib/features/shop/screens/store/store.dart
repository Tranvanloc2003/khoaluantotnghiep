import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/tabbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/product.carts/cart_menu_icon.dart';
import 'package:t_store/common/widgets/brands/brand_cart.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/store/widget/category_tab.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //search
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      const TSearchContainer(
                        text: 'Search in store',
                        showBorder: true,
                        showBackground: false,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      //featured brands
                      TSectionHeading(
                        title: 'Featured Brands',
                        showActionButton: true,
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),
                      //brands grid
                      TGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const TBrandCard(
                              showBorder: false,
                            );
                          }),
                    ],
                  ),
                ),
                //tab - tutorial
                bottom: const TTabBar(
                  tabs: [
                    Tab(
                      child: Text('Thể thao'),
                    ),
                    Tab(
                      child: Text('Nội thất'),
                    ),
                    Tab(
                      child: Text('Điện tử'),
                    ),
                    Tab(
                      child: Text('Quần áo'),
                    ),
                    Tab(
                      child: Text('Mỹ phẩm'),
                    ),
                  ],
                ),
              ),
            ];
          },

          //body
          body: const TabBarView(children: [
            CategoryTab(),
            CategoryTab(),
            CategoryTab(),
            CategoryTab(),
            CategoryTab(),
          ]),
        ),
      ),
    );
  }
}

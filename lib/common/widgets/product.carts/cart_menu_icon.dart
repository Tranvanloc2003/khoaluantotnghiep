import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key, required this.onPressed, this.iconColor= TColors.white,
  });
  final VoidCallback onPressed;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [ IconButton(onPressed: onPressed,icon: const Icon(Iconsax.shopping_bag),color:iconColor,),
      Positioned(
        right: 0,
        child: Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            color: TColors.black.withOpacity(.5),
            shape: BoxShape.circle,
          ),
          child: Center(child: Text('1',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.white, fontSizeFactor: .8),)),
        ),
      )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.onPressed,
    this.color,
    this.backgroundColor,
      // this.margin = 0,
  });

  final double? width, height, size;
  // final double margin;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      // margin: EdgeInsets.only(left: margin, right: 0),
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : (THelperFunctions.isDarkMode(context)
                ? TColors.black.withOpacity(0.9)
                : TColors.white.withOpacity(0.9)),
        borderRadius: BorderRadius.circular(100),
      ), // BoxDecoration
      child: IconButton(
          onPressed: onPressed, icon: Icon(icon, color: color, size: size)),
    );
  }
}

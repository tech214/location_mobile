import 'package:flutter/material.dart';
import 'package:location_mobile/components/theme/color.dart';
import '../themes/app_theme.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? titleColor;
  final double height;
  final double titleSize;
  final double iconSize;
  final double borderRadius;

  const ActionButton({
    Key? key,
    required this.title,
     this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.titleColor,
    this.height = 50,
    this.titleSize = 16,
    this.iconSize = 22,
    this.borderRadius = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null;

    return ElevatedButton.icon(
      onPressed: isDisabled ? null : onPressed,
      icon: Icon(
        icon,
        size: iconSize,
        color: titleColor ?? Colors.white,
      ),
      label: Text(
        title,
        style: AppThemes.primaryFontStyle.copyWith(
          fontSize: titleSize,
          color: titleColor ?? Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: isDisabled ? Colors.grey : (backgroundColor ?? AppColor.primary),
        minimumSize: Size.fromHeight(height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: 3,
      ),
    );
  }
}

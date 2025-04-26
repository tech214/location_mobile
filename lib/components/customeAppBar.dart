import 'package:flutter/material.dart';
import 'package:location_mobile/components/text_style.dart';
import '../themes/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final bool showBackButton;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.showBackButton = true,
    this.actions, required AppBarTheme backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    // Détecter si on est en mode sombre ou clair
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      backgroundColor: isDarkMode
          ? AppThemes.darkTheme.appBarTheme.backgroundColor
          : AppThemes.lightTheme.appBarTheme.backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: showBackButton,
      centerTitle: centerTitle,
      title: AppText(
        text: title,
        type: AppTextType.title,
        color: isDarkMode
            ? AppThemes.darkTheme.appBarTheme.titleTextStyle?.color
            : AppThemes.lightTheme.appBarTheme.titleTextStyle?.color,
      ),
      actions: actions,
      iconTheme: isDarkMode
          ? AppThemes.darkTheme.appBarTheme.iconTheme
          : AppThemes.lightTheme.appBarTheme.iconTheme,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

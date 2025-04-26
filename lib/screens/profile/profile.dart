import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:location_mobile/screens/profile/setting_item.dart';

import '../../components/theme/color.dart';
import '../../components/custom_image.dart';
import '../../components/icon_box.dart';
import '../../models/data.dart';
import '../bookingScreen.dart';
import '../favorite.dart';
import '../privacy.dart';
import '../settings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 280,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColor.primary, AppColor.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconBox(
                          bgColor: Colors.white.withOpacity(0.15),
                          child: SvgPicture.asset(
                            "assets/icons/edit.svg",
                            width: 18,
                            height: 18,
                          ),
                        ),
                      ],
                                        ),
                    ),
                    _buildProfile(),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: 230,
            child: FadeTransition(
              opacity: _animation,
              child: SlideTransition(
                position: Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(_animation),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: AppColor.appBgColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 12,
                        offset: const Offset(0, -6),
                      )
                    ],
                  ),
                  child: ListView(
                    children: [
                      const SizedBox(height: 30),
                      SettingItem(
                        title: "General Setting",
                        leadingIcon: Icons.settings,
                        leadingIconColor: AppColor.orange,
                        onTap: _navigateToGeneralSettings,
                      ),
                      const SizedBox(height: 12),
                      SettingItem(
                        title: "Bookings",
                        leadingIcon: Icons.bookmark_border,
                        leadingIconColor: AppColor.blue,
                        onTap: _navigateToBookings,
                      ),
                      const SizedBox(height: 12),
                      SettingItem(
                        title: "Favorites",
                        leadingIcon: Icons.favorite,
                        leadingIconColor: AppColor.red,
                        onTap: _navigateToFavorites,
                      ),
                      const SizedBox(height: 12),
                      SettingItem(
                        title: "Privacy",
                        leadingIcon: Icons.privacy_tip_outlined,
                        leadingIconColor: AppColor.green,
                        onTap: _navigateToPrivacy,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfile() {
    return Column(
      children: [
        Hero(
          tag: "profile-pic",
          child: CustomImage(
            profile["image"]!,
            width: 65,
            height: 65,
            radius: 48,
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          "Skjunior",
          style: TextStyle(
            color: AppColor.textColor,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "+224 610 11 16 27",
          style: TextStyle(
            color: AppColor.labelColor,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  void _navigateToGeneralSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GeneralSettingsPage()),
    );
  }

  void _navigateToBookings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BookingsPage()),
    );
  }

  void _navigateToFavorites() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FavoritesPage()),
    );
  }

  void _navigateToPrivacy() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PrivacyPage()),
    );
  }

  void _navigateToChangePassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
    );
  }

  _showConfirmLogout() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        message: const Text("Are you sure you want to log out?"),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {},
            child: const Text(
              "Log Out",
              style: TextStyle(color: AppColor.actionColor),
            ),
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
      ),
      body: const Center(
        child: Text("Change password page content."),
      ),
    );
  }
}

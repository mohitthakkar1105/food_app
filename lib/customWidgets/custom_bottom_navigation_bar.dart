import 'package:flutter/material.dart';
import 'package:foodie/utils/App_colors.dart';
import 'package:foodie/utils/app_routes.dart';

import '../utils/sizer.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final String currentRoute;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentRoute,
  });

  void _navigateToRoute(BuildContext context, String route) {
    if (currentRoute != route) {
      Navigator.pushReplacementNamed(context, route);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final sizer = Sizer()..init(context);

    return Container(
      height: sizer.setHeight(60),
      decoration: BoxDecoration(
        color: scheme.primary, // Solid orange color
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            context: context,
            icon: Icons.home_outlined,
            selectedIcon: Icons.home,
            route: AppRoutes.homeScreen,
            sizer: sizer
          ),
          _buildNavItem(
            context: context,
            icon: Icons.restaurant_outlined,
            selectedIcon: Icons.restaurant,
            route: AppRoutes.reelScreen,
            sizer: sizer
          ),
          _buildNavItem(
            context: context,
            icon: Icons.favorite_outline,
            selectedIcon: Icons.favorite,
            route: AppRoutes.searchScreen, 
            sizer: sizer
          ),
          _buildNavItem(
            context: context,
            icon: Icons.receipt_long_outlined,
            selectedIcon: Icons.receipt_long,
            route: AppRoutes.splash,
            sizer: sizer
          ),
          _buildNavItem(
            context: context,
            icon: Icons.headset_mic_outlined,
            selectedIcon: Icons.headset_mic,
            route: AppRoutes.createProfile,
            sizer: sizer
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required IconData selectedIcon,
    required String route,
    required Sizer sizer,
  }) {
    final isSelected = currentRoute == route;

    return InkWell(
      onTap: () => _navigateToRoute(context, route),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: sizer.setWidth(16), vertical: sizer.setHeight(6)),
        child: Icon(
          icon,
          color: AppColors.white,
          // color: isSelected ? AppColors.primary : AppColors.white,
          size: sizer.setSp(24),
        ),
      ),
    );
  }
}
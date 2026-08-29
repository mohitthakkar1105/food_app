import 'package:flutter/material.dart';
import 'package:foodie/customWidgets/custom_text.dart';
import 'package:foodie/utils/App_colors.dart';
import 'package:foodie/utils/app_routes.dart';

class CustomDrawer extends StatelessWidget {
  final sizer;

  const CustomDrawer({Key? key, required this.sizer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(sizer.setWidth(30.0)),
        bottomRight: Radius.circular(sizer.setWidth(50.0)),
      ),
      child: Container(
        width: sizer.setWidth(330.0),
        height: MediaQuery.of(context).size.height,
        color: AppColors.primary,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top spacing
              SizedBox(height: sizer.setHeight(40.0)),

              // Profile Section - HORIZONTAL (Profile Pic, Name, Email ek line mein)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(33.0)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Picture
                    Container(
                      width: sizer.setWidth(50.0),
                      height: sizer.setWidth(50.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        image: DecorationImage(
                          image: AssetImage('assets/images/png/profile.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: sizer.setWidth(25.0)),

                    // Name and Email Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                              text: 'John Smith',
                              fontSize:  sizer.setSp(25.0),
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'League Spartan',
                              lineHeight: 1.0,
                              letterSpacing: 0,
                          ),
                          SizedBox(height: sizer.setHeight(4.0)),
                          // Email
                          CustomText(
                            text: 'loremipsum@email.com',
                            fontSize:  sizer.setSp(15.0),
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'League Spartan',
                            lineHeight: 1.0,
                            letterSpacing: 0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: sizer.setHeight(32.0)),

              // Menu Items
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _DrawerMenuItem(
                      sizer: sizer,
                      icon: Icons.shopping_bag_outlined,
                      title: 'My Orders',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/orders');
                      },
                    ),
                    _buildDivider(sizer),

                    _DrawerMenuItem(
                      sizer: sizer,
                      icon: Icons.person_outline,
                      title: 'My Profile',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/profile');
                      },
                    ),
                    _buildDivider(sizer),

                    _DrawerMenuItem(
                      sizer: sizer,
                      icon: Icons.location_on_outlined,
                      title: 'Delivery Address',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/delivery-address');
                      },
                    ),
                    _buildDivider(sizer),

                    _DrawerMenuItem(
                      sizer: sizer,
                      icon: Icons.credit_card_outlined,
                      title: 'Payment Methods',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/payment-methods');
                      },
                    ),
                    _buildDivider(sizer),

                    _DrawerMenuItem(
                      sizer: sizer,
                      icon: Icons.phone_outlined,
                      title: 'Contact Us',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/contact-us');
                      },
                    ),
                    _buildDivider(sizer),

                    _DrawerMenuItem(
                      sizer: sizer,
                      icon: Icons.help_outline,
                      title: 'Help & FAQs',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/help-faqs');
                      },
                    ),
                    _buildDivider(sizer),

                    _DrawerMenuItem(
                      sizer: sizer,
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/settings');
                      },
                    ),
                    _buildDivider(sizer),

                    _DrawerMenuItem(
                      sizer: sizer,
                      icon: Icons.logout,
                      title: 'Log Out',
                      onTap: () {
                        Navigator.pop(context);
                        _showLogoutDialog(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Divider - Full width across drawer
  Widget _buildDivider(sizer) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(33.0)),
      child: Container(
        height: 1,
        color: Color(0xFFFFD8C7),
        margin: EdgeInsets.symmetric(vertical: sizer.setHeight(8.0)),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log Out'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.login,
                      (route) => false,
                );
              },
              child: Text('Log Out'),
            ),
          ],
        );
      },
    );
  }
}

class _DrawerMenuItem extends StatelessWidget {
  final sizer;
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _DrawerMenuItem({
    required this.sizer,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: sizer.setWidth(33.0),
          vertical: sizer.setHeight(12.0),
        ),
        child: Row(
          children: [
            // Icon Container
            Container(
              width: sizer.setWidth(40.3),
              height: sizer.setWidth(40.3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(sizer.setWidth(15.0)),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: sizer.setWidth(20.0),
              ),
            ),
            SizedBox(width: sizer.setWidth(16.0)),

            // Title - Expanded so it can wrap to next line if needed
            Expanded(
              child:
              CustomText(
                text: title,
                fontSize:  sizer.setSp(18.0),
                color: AppColors.white,
                fontWeight: FontWeight.w500,
                fontFamily: 'League Spartan',
                lineHeight: 1.2,
                letterSpacing: 0,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
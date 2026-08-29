import 'package:flutter/material.dart';
import 'package:foodie/utils/App_colors.dart';
import 'package:provider/provider.dart';
import '../../customWidgets/app_button.dart';
import '../../customWidgets/app_textfield.dart';
import '../../customWidgets/custom_auth_screen.dart';
import '../../utils/sizer.dart';
import 'create_profile_provider/profile_provider.dart';

class CreateProfileScreen extends StatelessWidget {
  static const primaryTextColor = Color(0xFF32343E);
  static const primaryColor = Color(0xFFFF7622);

  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final sizer = Sizer();
    sizer.init(context);

    return CustomAuthScreen(
      title: "Create Profile",
      subtitle: "Please fill to get started",
      onBackPressed: () {
        Navigator.pop(context);
      },
      content: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: sizer.setWidth(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: sizer.setHeight(30)),

              // NAME Field
              _buildFieldLabel('NAME', sizer),
              SizedBox(height: sizer.setHeight(8)),
              Consumer<ProfileProvider>(
                builder: (context, provider, child) {
                  return AppTextField(
                    hint: 'john doe',
                    controller: provider.nameController,
                    width: sizer.setWidth(327),
                    height: sizer.setHeight(62),
                    borderRadius: 10,
                    backgroundColor: AppColors.textFieldBackground,
                    hintColor: scheme.onSurface,
                  );
                },
              ),

              SizedBox(height: sizer.setHeight(20)),

              // MOBILE Field
              _buildFieldLabel('MOBILE', sizer),
              SizedBox(height: sizer.setHeight(8)),
              Consumer<ProfileProvider>(
                builder: (context, provider, child) {
                  return AppTextField(
                    hint: 'enter phone number',
                    controller: provider.mobileController,
                    keyboardType: TextInputType.phone,
                    width: sizer.setWidth(327),
                    height: sizer.setHeight(62),
                    borderRadius: 10,
                    backgroundColor: AppColors.textFieldBackground,
                    hintColor: scheme.onSurface,
                  );
                },
              ),

              SizedBox(height: sizer.setHeight(20)),

              // ADDRESS Field
              _buildFieldLabel('ADDRESS', sizer),
              SizedBox(height: sizer.setHeight(8)),
              Consumer<ProfileProvider>(
                builder: (context, provider, child) {
                  return AppTextField(
                    hint: 'enter address',
                    controller: provider.addressController,
                    width: sizer.setWidth(327),
                    height: sizer.setHeight(62),
                    borderRadius: 10,
                    backgroundColor: AppColors.textFieldBackground,
                    hintColor: scheme.onSurface,
                  );
                },
              ),

              SizedBox(height: sizer.setHeight(20)),

              // LOCATION Field
              _buildFieldLabel('LOCATION', sizer),
              SizedBox(height: sizer.setHeight(8)),
              Selector<ProfileProvider, String?>(
                selector: (_, provider) => provider.location,
                builder: (context, location, child) {
                  return GestureDetector(
                    onTap: () {
                      context.read<ProfileProvider>().accessLocation();
                    },
                    child: Container(
                      width: sizer.setWidth(327),
                      height: sizer.setHeight(62),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F5FA),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: sizer.setWidth(70)),
                          Expanded(
                            child: Text(
                              location ?? 'ACCESS LOCATION',
                              style: TextStyle(
                                fontFamily: 'Sen',
                                fontSize: sizer.setSp(16),
                                fontWeight: FontWeight.w500,
                                color: location != null
                                    ? primaryTextColor
                                    : const Color(0xFFA0A5BA),
                                height: 1.0,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.my_location,
                            color: const Color(0xFFA0A5BA),
                            size: sizer.setWidth(20),
                          ),
                          SizedBox(width: sizer.setWidth(16)),
                        ],
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: sizer.setHeight(32)),

              // Update Profile Button
              Selector<ProfileProvider, bool>(
                selector: (_, provider) => provider.isLoading,
                builder: (context, isLoading, child) {
                  return AppButton(
                    text: isLoading ? 'UPDATING...' : 'UPDATE PROFILE',
                    onTap: isLoading
                        ? () {}
                        : () {
                      context.read<ProfileProvider>().updateProfile(context);
                    },
                    backgroundColor: primaryColor,
                    textColor: Colors.white,
                    height: sizer.setHeight(62),
                    width: sizer.setWidth(327),
                    borderRadius: 12,
                  );
                },
              ),

              SizedBox(height: sizer.setHeight(30)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label, Sizer sizer) {
    return Text(
      label,
      style: TextStyle(
        fontFamily: 'Sen',
        fontWeight: FontWeight.w400,
        fontSize: sizer.setSp(13),
        color: primaryTextColor,
        letterSpacing: 0,
        height: 1.0,
      ),
    );
  }
}
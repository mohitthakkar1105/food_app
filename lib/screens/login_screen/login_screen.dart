import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/utils/App_colors.dart';
import 'package:foodie/utils/app_routes.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../customWidgets/app_button.dart';
import '../../customWidgets/app_textField.dart';
import '../../customWidgets/custom_auth_screen.dart';
import '../../customWidgets/custom_social_button.dart';
import '../../utils/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final sizer = Sizer();
    sizer.init(context);

    return CustomAuthScreen(
      title: "Log In",
      subtitle: "Please sign in to your existing account",
      content: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: sizer.setWidth(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: sizer.setHeight(30)),

              // Mobile Number Label
              Text(
                "Mobile Number",
                style: TextStyle(
                  fontFamily: 'Sen',
                  fontWeight: FontWeight.w400,
                  fontSize: sizer.setSp(13),
                  height: 1.0,
                  letterSpacing: 0,
                  color: scheme.onBackground,
                ),
              ),

              SizedBox(height: sizer.setHeight(8)),

              // Mobile Number TextField
              AppTextField(
                hint: "Enter your number",
                keyboardType: TextInputType.phone,
                width: sizer.setWidth(327),
                height: sizer.setHeight(62),
                borderRadius: 10,
                backgroundColor: AppColors.textFieldBackground,
                hintColor: scheme.onSurface,
              ),

              SizedBox(height: sizer.setHeight(20)),

              // Send OTP Button
              AppButton(
                text: "SEND OTP",
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.verification);
                },
                backgroundColor: scheme.primary,
                textColor: scheme.onPrimary,
                borderRadius: 12,
                height: sizer.setHeight(62),
                width: sizer.setWidth(327),
              ),

              SizedBox(height: sizer.setHeight(35)),

              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: sizer.setWidth(16),
                  ),
                  child: Text(
                    "Or",
                    style: TextStyle(
                      fontFamily: 'Sen',
                      fontWeight: FontWeight.w400,
                      fontSize: sizer.setSp(16),
                      height: 1.0,
                      letterSpacing: 0,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),

              SizedBox(height: sizer.setHeight(5)),

              // Continue With Text
              Center(
                child: Text(
                  "continue with",
                  style: TextStyle(
                    fontFamily: 'Sen',
                    fontWeight: FontWeight.w400,
                    fontSize: sizer.setSp(16),
                    height: 1.5,
                    letterSpacing: 0,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),

              SizedBox(height: sizer.setHeight(30)),

              // Social Login Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Facebook Button
                  SocialButton(
                    context: context,
                    icon: Icons.facebook,
                    color: const Color(0xFF395998),
                    onTap: () {
                      // Handle Facebook login
                    },
                  ),

                  SizedBox(width: sizer.setWidth(20)),

                  // Google Button
                  SocialButton(
                    context : context,
                    icon: Icons.g_mobiledata_rounded,
                    color: Colors.white,
                    borderColor: Colors.grey.shade300,
                    onTap: () async{
                      var user = await signInWithGoogle();

                      if (user != null) {
                        print("LOGIN SUCCESS: ${user.user?.email}");
                      } else {
                        print("LOGIN FAILED");
                      }
                    },
                  ),

                  SizedBox(width: sizer.setWidth(20)),

                  // Apple Button
                  SocialButton(
                    context: context,
                    icon: Icons.apple,
                    color: const Color(0xFF000000),
                    onTap: () {
                      // Handle Apple login
                    },
                  ),
                ],
              ),

              SizedBox(height: sizer.setHeight(30)),
            ],
          ),
        ),
      ),
    );
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      await googleSignIn.initialize();

      final GoogleSignInAccount googleUser =
      await googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, // ✅ ONLY THIS
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print("ERROR: $e");
      return null;
    }
  }
}

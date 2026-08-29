import 'package:flutter/material.dart';
import 'package:foodie/screens/verification_screen/verification_provider/verification_provider.dart';
import 'package:foodie/utils/App_colors.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../customWidgets/app_button.dart';
import '../../customWidgets/custom_auth_screen.dart';
import '../../utils/sizer.dart';

class VerificationScreen extends StatelessWidget {
  static const primaryTextColor = Color(0xFF32343E);
  static const primaryColor = Color(0xFFFF7622);

  const VerificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final sizer = Sizer();
    sizer.init(context);

    // Start timer when screen is built (only once)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VerificationProvider>().startTimer();
    });

    return CustomAuthScreen(
      title: "Verification",
      subtitle: "We have sent a code to your email",
      email: "email@com",
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

              // CODE Label
              Padding(
                padding: EdgeInsets.only(left: sizer.setWidth(14)),
                child: Text(
                  "CODE",
                  style: TextStyle(
                    fontFamily: 'Sen',
                    fontWeight: FontWeight.w400,
                    fontSize: sizer.setSp(13),
                    height: 1.0,
                    letterSpacing: 0,
                    color: scheme.onBackground,
                  ),
                ),
              ),

              SizedBox(height: sizer.setHeight(15)),

              // PIN Input
              Center(
                child: Selector<VerificationProvider, TextEditingController>(
                  selector: (_, provider) => provider.pinController,
                  builder: (context, pinController, child) {
                    return Pinput(
                      controller: pinController,
                      length: 4,
                      defaultPinTheme: PinTheme(
                        width: sizer.setWidth(70),
                        height: sizer.setHeight(70),
                        textStyle: TextStyle(
                          fontFamily: 'Sen',
                          fontSize: sizer.setSp(24),
                          fontWeight: FontWeight.w600,
                          color: scheme.onBackground,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.textFieldBackground,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: sizer.setWidth(70),
                        height: sizer.setHeight(70),
                        textStyle: TextStyle(
                          fontFamily: 'Sen',
                          fontSize: sizer.setSp(24),
                          fontWeight: FontWeight.w600,
                          color: scheme.onBackground,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFF0F5FA),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: scheme.primary, width: 2),
                        ),
                      ),
                      submittedPinTheme: PinTheme(
                        width: sizer.setWidth(70),
                        height: sizer.setHeight(70),
                        textStyle: TextStyle(
                          fontFamily: 'Sen',
                          fontSize: sizer.setSp(24),
                          fontWeight: FontWeight.w600,
                          color: scheme.onBackground,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFF0F5FA),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: primaryColor, width: 2),
                        ),
                      ),
                      showCursor: true,
                      onCompleted: (pin) {
                        print('OTP Completed: $pin');
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: sizer.setHeight(30)),

              // Verify Button
              Consumer<VerificationProvider>(
                builder: (context, otpProvider, child) {
                  return AppButton(
                    text: "VERIFY",
                    onTap: () {
                      otpProvider.verifyOtp(context);
                    },
                    backgroundColor: scheme.primary,
                    textColor: scheme.onPrimary,
                    borderRadius: 12,
                    height: sizer.setHeight(62),
                    width: sizer.setWidth(327),
                  );
                },
              ),

              SizedBox(height: sizer.setHeight(30)),

              // Resend Text
              Center(
                child: Selector<VerificationProvider, int>(
                  selector: (_, provider) => provider.remainingTime,
                  builder: (context, remainingTime, child) {
                    return remainingTime > 0
                        ? Text(
                      "Resend in.${remainingTime}sec",
                      style: TextStyle(
                        fontFamily: 'Sen',
                        fontWeight: FontWeight.w700,
                        fontSize: sizer.setSp(14),
                        height: 1.0,
                        letterSpacing: 0,
                        color: primaryColor,
                        decoration: TextDecoration.underline, // ✅ Ye already hai
                      ),
                    )
                        : Consumer<VerificationProvider>(
                      builder: (context, otpProvider, child) {
                        return GestureDetector(
                          onTap: () {
                            otpProvider.resendOtp();
                          },
                          child: Text(
                            "Resend",
                            style: TextStyle(
                              fontFamily: 'Sen',
                              fontWeight: FontWeight.w700,
                              fontSize: sizer.setSp(14),
                              height: 1.0,
                              letterSpacing: 0,
                              color: primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: sizer.setHeight(30)),
            ],
          ),
        ),
      ),
    );
  }
}
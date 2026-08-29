import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:foodie/utils/App_colors.dart';
import '../../customWidgets/app_button.dart';
import '../../customWidgets/custom_app_bar.dart';
import '../../customWidgets/custom_text.dart';
import '../../customWidgets/delivery_mode_card.dart';
import '../../utils/sizer.dart';

class DeliveryModeScreen extends StatefulWidget {
  const DeliveryModeScreen({super.key});

  @override
  State<DeliveryModeScreen> createState() => _DeliveryModeScreenState();
}

class _DeliveryModeScreenState extends State<DeliveryModeScreen> {
  final Sizer sizer = Sizer();
  String selectedDelivery = 'admin'; // 'admin' or 'vendor'

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final scaffoldBackground = Theme.of(context).scaffoldBackgroundColor;
    sizer.init(context);

    return Scaffold(
      backgroundColor: scaffoldBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom App Bar
          CustomAppbar(
            height: 100,
            showPrefix: true,
            centerTitle: true,
            showSuffix: true,
            suffix: SizedBox.shrink(),
            prefix: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: sizer.setWidth(40),
                height: sizer.setWidth(40),
                decoration: BoxDecoration(
                  color: const Color(0xFFECF0F4),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: sizer.setWidth(18),
                  color: Colors.black,
                ),
              ),
            ),
            title: CustomText(
              text: "Delivery Mode",
              fontSize: sizer.setSp(17),
              color: scheme.onBackground,
              fontWeight: FontWeight.w400,
              fontFamily: 'Sen',
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: sizer.setWidth(45)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: sizer.setHeight(20)),

                        // Title
                        CustomText(
                          text: "How do your want it?",
                          fontSize: sizer.setSp(20),
                          color: scheme.onBackground,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Sen',
                          lineHeight: 1.0,
                        ),

                        SizedBox(height: sizer.setHeight(10)),

                        // Subtitle
                        CustomText(
                          text: "Choose the service that fits your schedule.",
                          fontSize: sizer.setSp(14),
                          color: scheme.onSurface,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Sen',
                          lineHeight: 1.0,
                        ),

                        SizedBox(height: sizer.setHeight(20)),
                      ],
                    ),
                  ),

                  // Admin Delivery Card (Custom Widget)
                  DeliveryModeCard(
                    title: 'Admin Delivery',
                    subtitle: 'Delivered by App Pro couriers',
                    time: '15-25min',
                    price: '₹20',
                    isSelected: selectedDelivery == 'admin',
                    showFasterBadge: true,
                    showProBadge: true,
                    imagePath: 'assets/images/png/delivery_boy.png',
                    sizer: sizer,
                    onTap: () {
                      setState(() {
                        selectedDelivery = 'admin';
                      });
                    },
                  ),

                  SizedBox(height: sizer.setHeight(20)),

                  // Vendor Delivery Card (Custom Widget)
                  DeliveryModeCard(
                    title: 'Vendor Delivery',
                    subtitle: 'Delivered by restaurant staff',
                    time: '30-45min',
                    price: '₹15',
                    isSelected: selectedDelivery == 'vendor',
                    showFasterBadge: false,
                    showProBadge: false,
                    imagePath: 'assets/images/png/vendor_delivery_boy.png',
                    sizer: sizer,
                    onTap: () {
                      setState(() {
                        selectedDelivery = 'vendor';
                      });
                    },
                  ),

                  SizedBox(height: sizer.setHeight(20)),

                  // Info Message Box
                  Container(
                    width: sizer.setWidth(341),
                    margin: EdgeInsets.symmetric(horizontal: sizer.setWidth(20)),
                    padding: EdgeInsets.only(left: sizer.setWidth(8),top: sizer.setHeight(10),bottom: sizer.setHeight(10)),
                    decoration: BoxDecoration(
                      color: scheme.primary.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(sizer.setWidth(22)),
                      border: Border.all(
                        color: AppColors.primary,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: sizer.setWidth(25),
                          color: AppColors.primary,
                        ),
                        SizedBox(width: sizer.setWidth(12)),
                        Expanded(
                          child: CustomText(
                            text: "Admin delivery includes real-time GPS tracking and 24/7 customer support priority",
                            fontSize: sizer.setSp(14),
                            color: scheme.onSurface,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Sen',
                            lineHeight: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: sizer.setHeight(30)),
                  Padding(
                    padding:  EdgeInsets.only(
                        left: sizer.setWidth(50),
                        right: sizer.setWidth(50),
                      bottom: sizer.setHeight(40)
                    ),
                    child: DottedLine(
                      dashColor: AppColors.primary,
                    ),
                  ),
                  // Delivered To Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(31)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Delivered to: Vijay Nagar",
                          fontSize: sizer.setSp(14),
                          color: scheme.onSurface,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Sen',
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle change address
                          },
                          child: CustomText(
                            text: "Change",
                            fontSize: sizer.setSp(14),
                            color:AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Sen',
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: sizer.setHeight(20)),

                  // Continue to Checkout Button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(31)),
                    child: CustomAppButton(
                      height: sizer.setHeight(56),
                      width: double.infinity,
                      backgroundColor: scheme.primary,
                      borderRadius: sizer.setWidth(12),
                      onTap: () {
                        // Handle checkout
                      },
                      child: CustomText(
                        text: "Continue to Checkout",
                        fontSize: sizer.setSp(16),
                        color: scheme.onPrimary,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Sen',
                      ),
                    ),
                  ),

                  SizedBox(height: sizer.setHeight(40)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
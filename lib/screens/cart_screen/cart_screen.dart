import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:foodie/utils/App_colors.dart';
import 'package:foodie/utils/app_routes.dart';
import 'package:provider/provider.dart';

import '../../customWidgets/custom_app_bar.dart';
import '../../customWidgets/custom_text.dart';
import '../../utils/sizer.dart';
import 'cart_provider/cart_provider.dart';

class CartScreen extends StatelessWidget {
  final Sizer sizer = Sizer();

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizer.init(context);

    // Sample cart items data
    final cartItems = [
      {
        'image': 'assets/images/png/cart_item_1.png',
        'name': 'Pizza Calzone European',
        'price': '₹64',
      },
      {
        'image': 'assets/images/png/cart_item_2.png',
        'name': 'Pizza Calzone European',
        'price': '₹64',
      },
      {
        'image': 'assets/images/png/cart_item_1.png',
        'name': 'Pizza Calzone European',
        'price': '₹64',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppbar(
            height: 100,
            backgroundColor: Colors.white,
            showPrefix: true,
            showSuffix: true,
            centerTitle: true,
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
              text: "Cart",
              fontSize: sizer.setSp(18),
              color: const Color(0xFF181C2E),
              fontWeight: FontWeight.w600,
              fontFamily: 'Sen',
            ),
            suffix: GestureDetector(
              onTap: () {
                // Handle done action
              },
              child: CustomText(
                text: "DONE",
                fontSize: sizer.setSp(14),
                color: const Color(0xFF4EE476),
                fontWeight: FontWeight.w600,
                fontFamily: 'Sen',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: sizer.setWidth(24),
              top: sizer.setHeight(20),
              bottom: sizer.setHeight(20),
            ),
            child: CustomText(
              text: "Order items",
              fontSize: sizer.setSp(20),
              color: const Color(0xFF181C2E),
              fontWeight: FontWeight.w600,
              fontFamily: 'Sen',
            ),
          ),

          // Cart Items List
          Expanded(
            child: Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(24)),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    final quantity = cartProvider.getQuantity(index);

                    return Container(
                      width: sizer.setWidth(327),
                      height: sizer.setHeight(117),
                      margin: EdgeInsets.only(bottom: sizer.setHeight(36)),
                      child: Row(
                        children: [
                          // Product Image
                          Container(
                            width: sizer.setWidth(117),
                            height: sizer.setHeight(117),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(sizer.setWidth(20)),
                              color: AppColors.white,
                              image: DecorationImage(
                                image: AssetImage(item['image'] as String),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          SizedBox(width: sizer.setWidth(25)),

                          // Product Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Top Row - Name and Delete Button
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomText(
                                        text: item['name'] as String,
                                        fontSize: sizer.setSp(18),
                                        color: const Color(0xFF181C2E),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Sen',
                                        lineHeight: 1.0,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),

                                    // Delete Button
                                    GestureDetector(
                                      onTap: () {
                                        // Handle delete
                                      },
                                      child: Container(
                                        width: sizer.setWidth(27),
                                        height: sizer.setWidth(27),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFF4B4B),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.close,
                                          size: sizer.setWidth(16),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                CustomText(
                                  text: item['price'] as String,
                                  fontSize: sizer.setSp(18),
                                  color: const Color(0xFFFF7622),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Sen',
                                  lineHeight: 1.0,
                                ),
                                // Bottom Row - Price and Counter
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // Inc/Dec Counter
                                    Container(
                                      width: sizer.setWidth(100),
                                      height: sizer.setHeight(36),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFF7622).withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(sizer.setWidth(50)),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(sizer.setWidth(4)),
                                        child: Row(
                                          children: [
                                            // Minus Button
                                            GestureDetector(
                                              onTap: () {
                                                cartProvider.decrementQuantity(index);
                                              },
                                              child: Container(
                                                width: sizer.setWidth(28),
                                                height: sizer.setWidth(28),
                                                decoration: BoxDecoration(
                                                  color: quantity > 1
                                                      ? const Color(0xFFFF7622)
                                                      : Colors.transparent,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  Icons.remove,
                                                  size: sizer.setWidth(16),
                                                  color: quantity > 1
                                                      ? Colors.white
                                                      : Colors.white.withOpacity(0.3),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: sizer.setWidth(13),),
                                            // Count Text
                                            CustomText(
                                              text: "$quantity",
                                              fontSize: sizer.setSp(14),
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Sen',
                                              lineHeight: 1.0,
                                              letterSpacing: 0,
                                            ),
                                            SizedBox(width: sizer.setWidth(14),),
                                            // Plus Button
                                            GestureDetector(
                                              onTap: () {
                                                cartProvider.incrementQuantity(index);
                                              },
                                              child: Container(
                                                width: sizer.setWidth(28),
                                                height: sizer.setWidth(28),
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFFFF7622),
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  Icons.add,
                                                  size: sizer.setWidth(16),
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: sizer.setWidth(12)),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),

          // Bottom Section - Offers, Bill Summary, and Checkout
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: sizer.setWidth(24),
              vertical: sizer.setHeight(16),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, -4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Offers Section
                CustomText(
                  text: "Offers",
                  fontSize: sizer.setSp(20),
                  color: const Color(0xFF181C2E),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Sen',
                ),
                SizedBox(height: sizer.setHeight(12)),

                // Apply Coupon Code
                GestureDetector(
                  onTap: () {
                    // Handle coupon code action
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: sizer.setWidth(16),
                      vertical: sizer.setHeight(12),
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF5EE),
                      borderRadius: BorderRadius.circular(sizer.setWidth(12)),
                      border: Border.all(
                        color: const Color(0xFFFFE5D3),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: sizer.setWidth(32),
                          height: sizer.setWidth(32),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF7622),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.local_offer,
                            size: sizer.setWidth(18),
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: sizer.setWidth(12)),
                        Expanded(
                          child: CustomText(
                            text: "Apply Coupon Code",
                            fontSize: sizer.setSp(16),
                            color: const Color(0xFF181C2E),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Sen',
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: sizer.setWidth(24),
                          color: const Color(0xFF181C2E),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: sizer.setHeight(20)),

                // Bill Summary Container
                Container(
                  width: sizer.setWidth(340),
                  padding: EdgeInsets.all(sizer.setWidth(16)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(sizer.setWidth(10)),
                    border: Border.all(
                      color: const Color(0xFFE8E8E8),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Bill Summary Title
                      CustomText(
                        text: "Bill Summary",
                        fontSize: sizer.setSp(18),
                        color: const Color(0xFF181C2E),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Sen',
                      ),
                      SizedBox(height: sizer.setHeight(12)),

                      // Subtotal
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Subtotal",
                            fontSize: sizer.setSp(14),
                            color: const Color(0xFF7E8A97),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Sen',
                          ),
                          CustomText(
                            text: "₹32.00",
                            fontSize: sizer.setSp(14),
                            color: const Color(0xFF181C2E),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Sen',
                          ),
                        ],
                      ),
                      SizedBox(height: sizer.setHeight(10)),

                      // Taxes & Charges
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Taxes & Charges",
                            fontSize: sizer.setSp(14),
                            color: const Color(0xFF7E8A97),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Sen',
                          ),
                          CustomText(
                            text: "₹5.00",
                            fontSize: sizer.setSp(14),
                            color: const Color(0xFF181C2E),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Sen',
                          ),
                        ],
                      ),
                      SizedBox(height: sizer.setHeight(10)),

                      // Delivery Fee
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Delivery Fee",
                            fontSize: sizer.setSp(14),
                            color: const Color(0xFF7E8A97),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Sen',
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: "₹3.00",
                                fontSize: sizer.setSp(14),
                                color: const Color(0xFF7E8A97),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Sen',
                                decoration: TextDecoration.lineThrough,
                              ),
                              SizedBox(width: sizer.setWidth(6)),
                              CustomText(
                                text: "Free",
                                fontSize: sizer.setSp(14),
                                color: const Color(0xFFFF7622),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Sen',
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: sizer.setHeight(12)),

                      // Divider
                      DottedLine(
                        dashColor: AppColors.primary,
                      ),

                      SizedBox(height: sizer.setHeight(12)),

                      // Grand Total
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Grand Total",
                            fontSize: sizer.setSp(16),
                            color: const Color(0xFF181C2E),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Sen',
                          ),
                          CustomText(
                            text: "₹40.00",
                            fontSize: sizer.setSp(16),
                            color: const Color(0xFFFF7622),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Sen',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: sizer.setHeight(20)),

                // Process to Checkout Button
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.deliveryMode);
                  },
                  child: Container(
                    width: double.infinity,
                    height: sizer.setHeight(56),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF7622),
                      borderRadius: BorderRadius.circular(sizer.setWidth(12)),
                    ),
                    alignment: Alignment.center,
                    child: CustomText(
                      text: "Process to checkout",
                      fontSize: sizer.setSp(16),
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Sen',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:foodie/utils/app_routes.dart';
import 'package:provider/provider.dart';

import '../../customWidgets/app_button.dart';
import '../../customWidgets/custom_app_bar.dart';
import '../../customWidgets/custom_text.dart';
import '../../utils/sizer.dart';
import 'customize_dish_provider/customize_dish_provider.dart';

class CustomizeDishScreen extends StatelessWidget {
  final Sizer sizer = Sizer();

  CustomizeDishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizer.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with AppBar on top
          Stack(
            children: [
              // Main Image
              Container(
                width: sizer.setWidth(390),
                height: sizer.setHeight(321),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(sizer.setWidth(30)),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/png/food_1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Custom AppBar on top of image
              Positioned(
                top: 10,
                left: 0,
                right: 0,
                child: CustomAppbar(
                  height: 80,
                  backgroundColor: Colors.transparent,
                  showPrefix: true,
                  showSuffix: true,
                  centerTitle: false,
                  prefix: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: sizer.setWidth(45),
                      height: sizer.setWidth(45),
                      decoration: const BoxDecoration(
                        color: Color(0xFFECF0F4),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  suffix: Container(
                    width: sizer.setWidth(45),
                    height: sizer.setWidth(45),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      size: sizer.setWidth(20),
                      color: Colors.orange,
                    ),
                  ),
                  onSuffixTap: () {
                    // Handle favorite button
                  },
                ),
              ),
            ],
          ),

          // Rest of the content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(24)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: sizer.setHeight(24)),

                    // Title "Burger Bistro"
                    CustomText(
                      text: 'Burger Bistro',
                      fontSize: sizer.setSp(20),
                      color: const Color(0xFF181C2E),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Sen',
                      lineHeight: 1.0,
                      letterSpacing: 0,
                    ),

                    SizedBox(height: sizer.setHeight(25)),

                    // Rating, Delivery, Time Row
                    Row(
                      children: [
                        /// Star Icon
                        Icon(
                          Icons.star,
                          size: sizer.setWidth(20),
                          color: const Color(0xFFFF7622),
                        ),

                        SizedBox(width: sizer.setWidth(4)),

                        /// Rating
                        CustomText(
                          text: "4.7",
                          fontSize: sizer.setSp(16),
                          color: const Color(0xFF32343E),
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Sen',
                          lineHeight: 1.0,
                        ),

                        SizedBox(width: sizer.setWidth(16)),

                        /// Delivery Icon
                        Icon(
                          Icons.delivery_dining,
                          size: sizer.setWidth(20),
                          color: const Color(0xFFFF7622),
                        ),

                        SizedBox(width: sizer.setWidth(4)),

                        /// Delivery Info (Free)
                        CustomText(
                          text: "Free",
                          fontSize: sizer.setSp(14),
                          color: const Color(0xFF32343E),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Sen',
                          lineHeight: 1.0,
                        ),

                        SizedBox(width: sizer.setWidth(16)),

                        /// Clock Icon
                        Icon(
                          Icons.access_time,
                          size: sizer.setWidth(20),
                          color: const Color(0xFFFF7622),
                        ),

                        SizedBox(width: sizer.setWidth(4)),

                        /// Delivery Time
                        CustomText(
                          text: "20 min",
                          fontSize: sizer.setSp(14),
                          color: const Color(0xFF32343E),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Sen',
                          lineHeight: 1.0,
                        ),
                      ],
                    ),

                    SizedBox(height: sizer.setHeight(20)),

                    // Description Text
                    CustomText(
                      text: "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
                      fontSize: sizer.setSp(14),
                      color: const Color(0xFFA0A5BA),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Sen',
                      lineHeight: 24 / 14, // 24px line height for 14px font
                      letterSpacing: 0,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: sizer.setHeight(32)),

                    // Ingredients Heading
                    CustomText(
                      text: "INGREDIENTS",
                      fontSize: sizer.setSp(13),
                      color: const Color(0xFF32343E),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Sen',
                      lineHeight: 1.0,
                      letterSpacing: 0.02 * 13, // 2% letter spacing
                    ),

                    SizedBox(height: sizer.setHeight(20)),

                    // Ingredients List
                    SizedBox(
                      height: sizer.setHeight(84),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5, // Number of ingredients
                        itemBuilder: (context, index) {
                          // Sample data - you can replace with actual data
                          final ingredients = [
                            {'icon': Icons.rice_bowl, 'name': 'Salt', 'allergy': ''},
                            {'icon': Icons.egg, 'name': 'Chicken', 'allergy': ''},
                            {'icon': Icons.eco, 'name': 'Onion', 'allergy': '(Alergy)'},
                            {'icon': Icons.local_pizza, 'name': 'Garlic', 'allergy': '(Alergy)'},
                            {'icon': Icons.grass, 'name': 'Peppers', 'allergy': '(Alery)'},
                          ];

                          final item = ingredients[index];

                          return Container(
                            width: sizer.setWidth(50),
                            height: sizer.setHeight(84),
                            margin: EdgeInsets.only(right: sizer.setWidth(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Circular Icon Container
                                Container(
                                  width: sizer.setWidth(50),
                                  height: sizer.setWidth(50),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFF3ED),
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    item['icon'] as IconData,
                                    size: sizer.setWidth(24),
                                    color: const Color(0xFFFF7622),
                                  ),
                                ),

                                SizedBox(height: sizer.setHeight(5)),

                                // Ingredient Name with Allergy Info
                                SizedBox(
                                  width: sizer.setWidth(50),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Main Name
                                      Text(
                                        item['name'] as String,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: sizer.setSp(12),
                                          height: 1.0,
                                          letterSpacing: 0,
                                          color: const Color(0xFF32343E),
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                      // Allergy Info (if exists)
                                      if (item['allergy'] != null && (item['allergy'] as String).isNotEmpty)
                                        Text(
                                          item['allergy'] as String,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            fontSize: sizer.setSp(8),
                                            height: 1.0,
                                            letterSpacing: 0,
                                            color: const Color(0xFFA0A5BA),
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: sizer.setHeight(24)),

                    // Price and Counter Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Price
                        CustomText(
                          text: "₹32",
                          fontSize: sizer.setSp(28),
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Sen',
                        ),

                        // Inc/Dec Counter with Provider
                        Consumer<CustomizeDishProvider>(
                          builder: (context, dishProvider, child) {
                            return Container(
                              width: sizer.setWidth(130),
                              height: sizer.setHeight(48),
                              decoration: BoxDecoration(
                                color: const Color(0xFF32343E),
                                borderRadius: BorderRadius.circular(sizer.setWidth(50)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(sizer.setWidth(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // Minus Button
                                    GestureDetector(
                                      onTap: dishProvider.decrementQuantity,
                                      child: Container(
                                        width: sizer.setWidth(40),
                                        height: sizer.setWidth(40),
                                        decoration: BoxDecoration(
                                          color: dishProvider.quantity > 1
                                              ? const Color(0xFF3E4150)
                                              : Colors.transparent,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.remove,
                                          size: sizer.setWidth(20),
                                          color: dishProvider.quantity > 1
                                              ? Colors.white
                                              : Colors.white.withOpacity(0.3),
                                        ),
                                      ),
                                    ),
                                
                                    // Count Text
                                    CustomText(
                                      text: "${dishProvider.quantity}",
                                      fontSize: sizer.setSp(16),
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Sen',
                                      lineHeight: 1.0,
                                      letterSpacing: 0,
                                    ),
                                
                                    // Plus Button
                                    GestureDetector(
                                      onTap: dishProvider.incrementQuantity,
                                      child: Container(
                                        width: sizer.setWidth(40),
                                        height: sizer.setWidth(40),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF3E4150),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.add,
                                          size: sizer.setWidth(20),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: sizer.setHeight(24)),

                    // Add to Cart Button
                    CustomAppButton(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.cartScreen);
                      },
                      backgroundColor: const Color(0xFFFF7622),
                      borderRadius: sizer.setWidth(12),
                      height: sizer.setHeight(62),
                      child: CustomText(
                        text: "ADD TO CART",
                        fontSize: sizer.setSp(15),
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Sen',
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: sizer.setHeight(24)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
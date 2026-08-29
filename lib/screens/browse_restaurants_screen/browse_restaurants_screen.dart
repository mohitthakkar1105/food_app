import 'package:flutter/material.dart';
import 'package:foodie/customWidgets/custom_app_bar.dart';
import 'package:foodie/customWidgets/custom_text.dart';
import 'package:foodie/utils/App_colors.dart';

import '../../customWidgets/app_card.dart';
import '../../utils/sizer.dart';

class BrowseRestaurantsScreen extends StatelessWidget {
  const BrowseRestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizer = Sizer()..init(context);
    final foodItems = [
      {
        "title": "Burger Ferguson",
        "subtitle": "Spicy Restaurant",
        "image": "assets/images/png/food_1.png",
        "price": "₹40",
      },
      {
        "title": "Rockin' Burgers",
        "subtitle": "Cafenio/hfhfhff",
        "image": "assets/images/png/food_2.png",
        "price": "₹40",
      },
      {
        "title": "Burger Ferguson",
        "subtitle": "Spicy Restaurant",
        "image": "assets/images/png/food_3.png",
        "price": "₹40",
      },
      {
        "title": "Rockin' Burgers",
        "subtitle": "Cafenio/hfhfhff",
        "image": "assets/images/png/food_4.png",
        "price": "₹40",
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(
              height: sizer.setHeight(100),
              title: CustomText(
                text: "Reel",
                fontSize: 17,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
                lineHeight: 1,
                fontFamily: "Sen",
              ),
              centerTitle: true,
              showPrefix: true,
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
              showSuffix: true,
              suffix: Stack(
                children: [
                  Container(
                    width: sizer.setWidth(40),
                    height: sizer.setWidth(40),
                    decoration: BoxDecoration(
                      color: const Color(0xFF32343E),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                      size: sizer.setWidth(20),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: sizer.setWidth(16),
                      height: sizer.setWidth(16),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF7622),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: sizer.setSp(10),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Image.asset(
                  'assets/images/png/hotel.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: sizer.setHeight(196),
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.broken_image,
                      color: Colors.white,
                      size: 28,
                    );
                  },
                ),

                // 🔥 Spicy Restaurant
                Positioned(
                  left: sizer.setWidth(24),
                  bottom: sizer.setHeight(38),
                  child: SizedBox(
                    width: sizer.setWidth(180),
                    height: sizer.setHeight(26),
                    child: CustomText(
                      text: "Spicy Restaurant",
                      fontSize: sizer.setSp(22),
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Sen",
                      lineHeight: 1.0,
                      letterSpacing: 0,
                    ),
                  ),
                ),

                // 📍 Location - Vijay Nagar - 20 m
                Positioned(
                  left: sizer.setWidth(27),
                  bottom: sizer.setHeight(16),
                  child: SizedBox(
                    width: sizer.setWidth(171),
                    height: sizer.setHeight(17),
                    child: CustomText(
                      text: "Location - Vijay Nagar - 20 m",
                      fontSize: sizer.setSp(14),
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Sen",
                      lineHeight: 1.0,
                      letterSpacing: 0,
                    ),
                  ),
                ),

                // ⭐ Rating Badge
                Positioned(
                  right: sizer.setWidth(24),
                  bottom: sizer.setHeight(25),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: sizer.setWidth(6),
                      vertical: sizer.setHeight(6),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: const Color(0xFFFF7622),
                          size: sizer.setWidth(16),
                        ),
                        SizedBox(width: sizer.setWidth(2)),
                        CustomText(
                          text: "4.5",
                          fontSize: sizer.setSp(14),
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Sen",
                          lineHeight: 1.0,
                          letterSpacing: 0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: sizer.setHeight(16)),
            // Horizontal scrollable container with Watch Reels, Party Pop, Scan Tag
            SizedBox(
              height: sizer.setHeight(28),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(26)),
                itemCount: 3,
                itemBuilder: (context, index) {
                  final items = [
                    {'icon': Icons.play_arrow, 'text': 'Watch reels'},
                    {'icon': Icons.celebration_outlined, 'text': 'Party Pop'},
                    {'icon': Icons.qr_code_scanner, 'text': 'Scan Tag'},
                  ];

                  return Container(
                    width: sizer.setWidth(104),
                    height: sizer.setHeight(28),
                    margin: EdgeInsets.only(
                      right: index < 2 ? sizer.setWidth(8) : 0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFEDEDED),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          items[index]['icon'] as IconData,
                          size: sizer.setWidth(18),
                          color: const Color(0xFFFF7622),
                        ),
                        SizedBox(width: sizer.setWidth(5)),
                        CustomText(
                          text: items[index]['text'] as String,
                          fontSize: sizer.setSp(12),
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Sen',
                          lineHeight: 1.0,
                          letterSpacing: 0,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: sizer.setHeight(30)),
            Padding(
              padding: EdgeInsets.only(left: sizer.setWidth(25)),
              child: CustomText(
                text: "Active Offers",
                fontSize: sizer.setSp(20),
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
              ),
            ),
            SizedBox(height: sizer.setHeight(18)),
            // Active Offers horizontal scrollable containers
            SizedBox(
              height: sizer.setHeight(91),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(14)),
                itemCount: 2,
                itemBuilder: (context, index) {
                  final offers = [
                    {
                      'code': 'SAVE50',
                      'discount': '50 % OFF up to ₹10',
                      'condition': 'On orders above ₹20'
                    },
                    {
                      'code': 'FREEDEL',
                      'discount': 'Free Delivery',
                      'condition': 'First 2 orders'
                    },
                  ];

                  return Container(
                    width: sizer.setWidth(217),
                    height: sizer.setHeight(91),
                    margin: EdgeInsets.only(
                      right: index < 1 ? sizer.setWidth(10) : 0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDE0BB).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFFF7622),
                        width: 1,
                      ),
                    ),
                    padding: EdgeInsets.only(
                      left: sizer.setWidth(20),
                      top: sizer.setHeight(13),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.discount_outlined,
                              size: sizer.setWidth(22),
                              color: const Color(0xFFFF7622),
                            ),
                            SizedBox(width: sizer.setWidth(8)),
                            CustomText(
                              text: offers[index]['code'] as String,
                              fontSize: sizer.setSp(14),
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Sen',
                              lineHeight: 1.0,
                              letterSpacing: 0,
                            ),
                          ],
                        ),
                        SizedBox(height: sizer.setHeight(10)),
                        CustomText(
                          text: offers[index]['discount'] as String,
                          fontSize: sizer.setSp(14),
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Sen',
                          lineHeight: 1.0,
                          letterSpacing: 0,
                        ),
                        SizedBox(height: sizer.setHeight(5)),
                        CustomText(
                          text: offers[index]['condition'] as String,
                          fontSize: sizer.setSp(12),
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Sen',
                          lineHeight: 1.0,
                          letterSpacing: 0,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: sizer.setHeight(30)),
            // Category horizontal scrollable containers
            SizedBox(
              height: sizer.setHeight(92),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: sizer.setWidth(20)),
                itemCount: 6,
                itemBuilder: (context, index) {
                  final categories = [
                    {'icon': '🍟', 'name': 'Snacks'},
                    {'icon': '🍱', 'name': 'Meal'},
                    {'icon': '🥗', 'name': 'Vegan'},
                    {'icon': '🌮', 'name': 'Non Veg'},
                    {'icon': '🍹', 'name': 'Drinks'},
                    {'icon': '🍰', 'name': 'Dessert'},
                  ];

                  return Container(
                    width: sizer.setWidth(75),
                    height: sizer.setHeight(80),
                    child: Column(
                      children: [
                        Container(
                          width: sizer.setWidth(49),
                          height: sizer.setWidth(62),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3E9B5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            categories[index]['icon'] as String,
                            style: TextStyle(
                              fontSize: sizer.setSp(28),
                            ),
                          ),
                        ),
                        SizedBox(height: sizer.setHeight(4)),
                        Text(
                          categories[index]['name'] as String,
                          style: TextStyle(
                            fontFamily: 'League Spartan',
                            fontWeight: FontWeight.w400,
                            fontSize: sizer.setSp(12),
                            height: 1.0,
                            letterSpacing: 0,
                            color: AppColors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: sizer.setHeight(10)),
            Padding(
              padding: EdgeInsets.only(left: sizer.setWidth(25)),
              child: CustomText(
                text: "Snacks",
                fontSize: sizer.setSp(20),
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
                fontFamily: "Sen",
              ),
            ),
            CustomFoodGridView(
              items: foodItems,
              onAddPressed: (index) {
                print("Item $index added");
              },
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:foodie/utils/app_routes.dart';
import 'package:provider/provider.dart';

import '../../customWidgets/custom_bottom_navigation_bar.dart';
import '../../customWidgets/restaurant_card.dart';
import '../../customWidgets/trending_reel_card.dart';
import '../../utils/sizer.dart';
import '../drawer_screen/drawer_screen.dart';
import '../drawer_screen/provider/drawer_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final sizer = Sizer()..init(context);
    final drawerProvider = Provider.of<DrawerProvider>(context);


    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey, // 🔥 important
      drawer: CustomDrawer(sizer: sizer),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: sizer.setHeight(20)),

              /// ==================== HEADER ====================
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(24)),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Menu Icon
                    InkWell(
                      onTap: () {
                        // Drawer open karne ke liye
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      child: Container(
                        child: Icon(
                          Icons.menu,
                          color: Color(0xFFFF6B35),
                          size: sizer.setWidth(24),
                        ),
                      ),
                    ),
                    SizedBox(width: sizer.setWidth(20),),
                    /// Deliver To
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DELIVER TO',
                          style: TextStyle(
                            fontFamily: 'Sen',
                            fontSize: sizer.setSp(10),
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFFF7622),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'vijay nagar office',
                              style: TextStyle(
                                fontFamily: 'Sen',
                                fontSize: sizer.setSp(14),
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF676767
                                ),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: sizer.setWidth(16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: sizer.setWidth(114),),
                    /// Cart Icon with Badge
                    Stack(
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
                  ],
                ),
              ),

              SizedBox(height: sizer.setHeight(20)),

              /// Greeting Text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(24)),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Sen',
                      fontSize: sizer.setSp(16),
                      color: const Color(0xFF32343E),
                    ),
                    children: const [
                      TextSpan(text: 'Hey Ram, '),
                      TextSpan(
                        text: 'Good Afternoon!',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: sizer.setHeight(20)),

              /// Search Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(24)),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.searchScreen);
                  },
                  child: Container(
                    height: sizer.setHeight(62),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: sizer.setWidth(16)),
                        Icon(
                          Icons.search,
                          color: const Color(0xFFA0A5BA),
                          size: sizer.setWidth(20),
                        ),
                        SizedBox(width: sizer.setWidth(12)),
                        Text(
                          'Search dishes, restaurants',
                          style: TextStyle(
                            fontFamily: 'Sen',
                            fontSize: sizer.setSp(14),
                            color: const Color(0xFFA0A5BA),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: sizer.setHeight(24)),

              /// ==================== TRENDING REELS SECTION ====================
              Padding(
                padding: EdgeInsets.only(left: sizer.setWidth(27)),
                child: Text(
                  'Trending Reels',
                  style: TextStyle(
                    fontFamily: 'Sen',
                    fontWeight: FontWeight.w400,
                    fontSize: sizer.setSp(20),
                    height: 1.0,
                    color: const Color(0xFF32343E),
                  ),
                ),
              ),

              SizedBox(height: sizer.setHeight(16)),

              /// Trending Reels Horizontal List
              SizedBox(
                height: sizer.setHeight(215),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(27)),
                  itemCount: 3, // Changed from 5 to 3 (only reel_1, reel_2, reel_3 exist)
                  separatorBuilder: (context, index) => SizedBox(width: sizer.setWidth(16)),
                  itemBuilder: (context, index) {
                    return TrendingReelCard(
                      imagePath: 'assets/images/png/reel_${index + 1}.png',
                      dishName: 'Best Pizza',
                      views: '1.2M views',
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.reelScreen);
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: sizer.setHeight(32)),

              /// ==================== ALL CATEGORIES SECTION ====================
              SectionHeader(
                title: 'All Categories',
                onSeeAllTap: () {
                  // Navigate to categories page
                },
              ),

              SizedBox(height: sizer.setHeight(15)),

              /// Categories Grid
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(27)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryCard(
                      imagePath: 'assets/images/png/burger.png',
                      dishName: 'Veg',
                      onTap: () {},
                    ),
                    CategoryCard(
                      imagePath: 'assets/images/png/burger.png',
                      dishName: 'Non Veg',
                      onTap: () {},
                    ),
                    CategoryCard(
                      imagePath: 'assets/images/png/burger.png',
                      dishName: 'Trending',
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              SizedBox(height: sizer.setHeight(32)),

              /// ==================== RESTAURANTS SECTION ====================
              SectionHeader(
                title: 'Restaurants',
                onSeeAllTap: () {
                  // Navigate to restaurants page
                },
              ),

              SizedBox(height: sizer.setHeight(16)),

              /// Restaurant Cards List
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(27)),
                child: Column(
                  children: [
                    RestaurantCard(
                      imagePath: 'assets/images/png/hotel.png',
                      restaurantName: 'Rose Garden Restaurant',
                      cuisineTypes: 'Burger - Chicken - Riche - Wings',
                      rating: '4.7',
                      deliveryInfo: 'Free',
                      deliveryTime: '20 min',
                      onTap: () {
                        // Navigate to restaurant details
                      },
                    ),
                    SizedBox(height: sizer.setHeight(16)),
                    RestaurantCard(
                      imagePath: 'assets/images/png/hotel.png',
                      restaurantName: 'Rose Garden Restaurant',
                      cuisineTypes: 'Burger - Chicken - Riche - Wings',
                      rating: '4.7',
                      deliveryInfo: 'Free',
                      deliveryTime: '20 min',
                      onTap: () {
                        // Navigate to restaurant details
                      },
                    ),
                    SizedBox(height: sizer.setHeight(16)),
                    RestaurantCard(
                      imagePath: 'assets/images/png/hotel.png',
                      restaurantName: 'Rose Garden Restaurant',
                      cuisineTypes: 'Burger - Chicken - Riche - Wings',
                      rating: '4.7',
                      deliveryInfo: 'Free',
                      deliveryTime: '20 min',
                      onTap: () {
                        // Navigate to restaurant details
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: sizer.setHeight(32)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentRoute: AppRoutes.homeScreen, // ← Important!
      ),
    );
  }
}
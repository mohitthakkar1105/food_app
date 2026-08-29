import 'package:flutter/material.dart';
import 'package:foodie/customWidgets/app_scaffold.dart';
import 'package:foodie/customWidgets/custom_app_bar.dart';
import 'package:foodie/screens/search_screen/search_provider/search_provider.dart';
import 'package:foodie/utils/App_colors.dart';
import 'package:foodie/utils/app_routes.dart';
import 'package:foodie/utils/sizer.dart';
import 'package:provider/provider.dart';

import '../../customWidgets/app_textField.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizer = Sizer()..init(context);
    final TextEditingController search = TextEditingController();

    return AppScaffold(
      backgroundColor: AppColors.white,

      /// 🔝 APP BAR
      appBar: CustomAppBar(
        height: 90,
        backgroundColor: Colors.white,
        elevation: 0,

        /// 🔹 PREFIX (Back Button)
        prefix: Container(
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
        onPrefixTap: () {
          Navigator.pop(context);
        },

        /// 🔹 TITLE
        title: "Search",
        titleColor: Colors.black,
        centerTitle: false,

        /// 🔹 SUFFIX (Cart + badge)
        suffix: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: sizer.setWidth(45),
              height: sizer.setWidth(45),
              decoration: const BoxDecoration(
                color: Color(0xFF181C2E),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
                size: sizer.setWidth(20),
              ),
            ),

            /// 🔴 Badge
            Positioned(
              right: -sizer.setWidth(6),
              top: -sizer.setHeight(6),
              child: Container(
                width: sizer.setWidth(25),
                height: sizer.setWidth(25),
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  "2",
                  style: TextStyle(
                    fontFamily: "Sen",
                    fontWeight: FontWeight.w700,
                    fontSize: sizer.setSp(16),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        onSuffixTap: () {
          debugPrint("Cart tapped");
        },
      ),

      /// 🧱 BODY
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: sizer.setHeight(24)),
        
            /// 🔍 Search TextField
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(24)),
              child: AppTextField(
                hint: "Search dishes, restaurants",
                icon: Icons.search,
                backgroundColor: const Color(0xFFF0F5FA),
                iconColor: const Color(0xFFA0A5BA),
                hintColor: const Color(0xFFA0A5BA),
                textColor: const Color(0xFF1C1C28),
                borderRadius: 12,
                width: sizer.setWidth(327),
                height: sizer.setHeight(62),
                controller: search,
                suffixIcon: Icon(
                  Icons.close,
                  size: sizer.setWidth(18),
                  color: const Color(0xFFA0A5BA),
                ),
                onChanged: (value) {
                  debugPrint("Search: $value");
                },
              ),
            ),
        
            SizedBox(height: sizer.setHeight(28)),
        
            /// 🏷 Recent Keywords Title
            Padding(
              padding: EdgeInsets.only(left: sizer.setWidth(24)),
              child: Text(
                "Recent Keywords",
                style: TextStyle(
                  fontFamily: "Sen",
                  fontWeight: FontWeight.w400,
                  fontSize: sizer.setSp(20),
                  height: 1.0,
                  letterSpacing: 0,
                  color: const Color(0xFF32343E),
                ),
              ),
            ),
        
            SizedBox(height: sizer.setHeight(16)),
        
            /// 🔘 Chips Row
            SizedBox(
              height: sizer.setHeight(46),
              child: Consumer<SearchProvider>(
                builder: (context, provider, _) {
                  final keywords = ["Burger", "Sandwich", "Pizza","Cake"];
        
                  return ListView.separated(
                    padding:
                    EdgeInsets.symmetric(horizontal: sizer.setWidth(24)),
                    scrollDirection: Axis.horizontal,
                    itemCount: keywords.length,
                    separatorBuilder: (_, __) =>
                        SizedBox(width: sizer.setWidth(12)),
                    itemBuilder: (context, index) {
                      final text = keywords[index];
                      final bool isSelected = provider.selected == text;
        
                      return GestureDetector(
                        onTap: () {
                          provider.select(text);
                          search.text = text;
                        },
                        child: Container(
                          width: sizer.setWidth(89),
                          height: sizer.setHeight(46),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(33),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFFFF7622)
                                  : const Color(0xFFEDEDED),
                              width: 1.5,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            text,
                            style: TextStyle(
                              fontFamily: "Sen",
                              fontWeight: FontWeight.w400,
                              fontSize: sizer.setSp(16),
                              height: 1.0,
                              letterSpacing: -0.33,
                              color: const Color(0xFF32343E),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: sizer.setHeight(32)),
        
            /// 🍽 Suggested Restaurants Title
            Padding(
              padding: EdgeInsets.only(left: sizer.setWidth(24)),
              child: Text(
                "Suggested Restaurants",
                style: TextStyle(
                  fontFamily: "Sen",
                  fontWeight: FontWeight.w400,
                  fontSize: sizer.setSp(20),
                  height: 1.0,
                  letterSpacing: 0,
                  color: const Color(0xFF32343E),
                ),
              ),
            ),
        
            SizedBox(height: sizer.setHeight(30)),
        
            /// 📋 Suggested Restaurants List
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(24)),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                separatorBuilder: (_, __) => Padding(
                  padding: EdgeInsets.symmetric(vertical: sizer.setHeight(12)),
                  child: const Divider(
                    color: Color(0xFFEDEDED),
                    thickness: 1,
                  ),
                ),
                itemBuilder: (context, index) {
                  final data = [
                    {
                      "name": "Pansi Restaurant",
                      "rating": "4.7",
                      "image": "assets/images/pansi.png",
                    },
                    {
                      "name": "American Spicy Burger Shop",
                      "rating": "4.3",
                      "image": "assets/images/american.png",
                    },
                    {
                      "name": "Cafenio Coffee Club",
                      "rating": "4.0",
                      "image": "assets/images/cafenio.png",
                    },
                  ];
        
                  final item = data[index];
        
                  return GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, AppRoutes.browseRestaurants);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// 🖼 Image (Broken fallback)
                        Container(
                          width: sizer.setWidth(60),
                          height: sizer.setHeight(50),
                          decoration: BoxDecoration(
                            color: const Color(0xFFA0A5BA),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            item["image"]!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.broken_image,
                                color: Colors.white,
                                size: 28,
                              );
                            },
                          ),
                        ),

                        SizedBox(width: sizer.setWidth(10)),

                        /// 📝 Name + Rating Column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Restaurant Name
                            SizedBox(
                              width: sizer.setWidth(220),
                              child: Text(
                                item["name"]!,
                                style: TextStyle(
                                  fontFamily: "Sen",
                                  fontWeight: FontWeight.w400,
                                  fontSize: sizer.setSp(16),
                                  height: 1.0,
                                  letterSpacing: -0.33,
                                  color: const Color(0xFF32343E),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                            SizedBox(height: sizer.setHeight(8)),

                            /// ⭐ Rating Row
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Color(0xFFFFC529),
                                ),
                                SizedBox(width: sizer.setWidth(6)),
                                Text(
                                  item["rating"]!,
                                  style: TextStyle(
                                    fontFamily: "Sen",
                                    fontWeight: FontWeight.w400,
                                    fontSize: sizer.setSp(16),
                                    height: 1.0,
                                    letterSpacing: 0,
                                    color: const Color(0xFF32343E),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: sizer.setHeight(32)),
        
            /// 🍕 Popular Fast Food Title
            Padding(
              padding: EdgeInsets.only(left: sizer.setWidth(24)),
              child: Text(
                "Popular Fast Food",
                style: TextStyle(
                  fontFamily: "Sen",
                  fontWeight: FontWeight.w400,
                  fontSize: sizer.setSp(20),
                  height: 1.0,
                  letterSpacing: 0,
                  color: const Color(0xFF32343E),
                ),
              ),
            ),
        
            SizedBox(height: sizer.setHeight(20)),
        
            /// 🧩 Popular Fast Food Grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(24)),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: sizer.setWidth(16),
                  crossAxisSpacing: sizer.setWidth(16),
                  childAspectRatio: 153 / 160,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  final data = [
                    {
                      "title": "European Pizza",
                      "subtitle": "Uttora Coffe House",
                      "image": "assets/images/european.png",
                    },
                    {
                      "title": "Buffalo Pizza",
                      "subtitle": "Cafenio Coffee Club",
                      "image": "assets/images/buffalo.png",
                    },
                    {
                      "title": "Chicken Burger",
                      "subtitle": "American Spicy",
                      "image": "assets/images/burger.png",
                    },
                    {
                      "title": "Pasta",
                      "subtitle": "Italiano House",
                      "image": "assets/images/pasta.png",
                    },
                  ];
        
                  final item = data[index];
        
                  return Container(
                    width: sizer.setWidth(153),
                    height: sizer.setHeight(160),
                    padding: EdgeInsets.all(sizer.setWidth(12)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// 🖼 Image
                        Container(
                          width: sizer.setWidth(122),
                          height: sizer.setHeight(84),
                          decoration: BoxDecoration(
                            color: const Color(0xFFA0A5BA),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            item["image"]!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.broken_image,
                                color: Colors.white,
                                size: 30,
                              );
                            },
                          ),
                        ),
        
                        SizedBox(height: sizer.setHeight(10)),
        
                        /// 🍽 Food Name
                        Text(
                          item["title"]!,
                          style: TextStyle(
                            fontFamily: "Sen",
                            fontWeight: FontWeight.w700,
                            fontSize: sizer.setSp(15),
                            height: 1.0,
                            letterSpacing: -0.33,
                            color: const Color(0xFF32343E),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
        
                        SizedBox(height: sizer.setHeight(6)),
        
                        /// 🏠 Restaurant Name
                        Text(
                          item["subtitle"]!,
                          style: TextStyle(
                            fontFamily: "Sen",
                            fontWeight: FontWeight.w400,
                            fontSize: sizer.setSp(13),
                            height: 1.0,
                            letterSpacing: 0,
                            color: const Color(0xFFA0A5BA),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}

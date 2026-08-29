import 'package:flutter/material.dart';
import 'package:foodie/customWidgets/custom_text.dart';
import 'package:foodie/utils/App_colors.dart';
import 'package:foodie/utils/app_routes.dart';

import '../../utils/sizer.dart';

class CustomFoodGridView extends StatelessWidget {
  final List<Map<String, String>> items;
  final Function(int index)? onAddPressed;

  const CustomFoodGridView({
    super.key,
    required this.items,
    this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    final sizer = Sizer()..init(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(24)),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: sizer.setWidth(16),
          crossAxisSpacing: sizer.setWidth(16),
          childAspectRatio: 153 / 210,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, AppRoutes.customizeDish);
            },
            child: Container(
              width: sizer.setWidth(153),
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// 🖼 Image with rounded corners
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: sizer.setHeight(120),
                      color: const Color(0xFFA0A5BA),
                      child: Image.asset(
                        item["image"] ?? '',
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
                  ),
            
                  Padding(
                    padding: EdgeInsets.all(sizer.setWidth(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /// 🍽 Food Name
                        CustomText(
                          text: item["title"] ?? '',
                          fontSize: sizer.setSp(15),
                          color: const Color(0xFF32343E),
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Sen',
                          lineHeight: 1.0,
                          letterSpacing: -0.33,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
            
                        SizedBox(height: sizer.setHeight(4)),
            
                        /// 🏠 Restaurant Name
                        CustomText(
                          text: item["subtitle"] ?? '',
                          fontSize: sizer.setSp(13),
                          color: const Color(0xFFA0A5BA),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Sen',
                          lineHeight: 1.0,
                          letterSpacing: 0,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
            
                        SizedBox(height: sizer.setHeight(8)),
            
                        /// 💰 Price and Plus Button Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: item["price"] ?? '',
                              fontSize: sizer.setSp(14),
                              color: const Color(0xFF32343E),
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Sen',
                              lineHeight: 1.0,
                              letterSpacing: -0.33,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (onAddPressed != null) {
                                  onAddPressed!(index);
                                }
                              },
                              child: Container(
                                width: sizer.setWidth(30),
                                height: sizer.setWidth(30),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFF7622),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: sizer.setWidth(18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
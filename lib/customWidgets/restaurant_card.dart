import 'package:flutter/material.dart';
import '../utils/sizer.dart';

class RestaurantCard extends StatelessWidget {
  final String imagePath;
  final String restaurantName;
  final String cuisineTypes;
  final String rating;
  final String deliveryInfo;
  final String deliveryTime;
  final VoidCallback? onTap;

  const RestaurantCard({
    super.key,
    required this.imagePath,
    required this.restaurantName,
    required this.cuisineTypes,
    required this.rating,
    required this.deliveryInfo,
    required this.deliveryTime,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final sizer = Sizer()..init(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: sizer.setWidth(327),
        height: sizer.setHeight(235),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1AD8DAE0),
              offset: Offset(1, 8),
              blurRadius: 16,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Restaurant Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.asset(
                imagePath,
                width: sizer.setWidth(327),
                height: sizer.setHeight(140),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: sizer.setWidth(327),
                    height: sizer.setHeight(140),
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.restaurant,
                      size: sizer.setWidth(50),
                      color: Colors.grey[600],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: sizer.setWidth(16),
                vertical: sizer.setHeight(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Restaurant Name
                  Text(
                    restaurantName,
                    style: TextStyle(
                      fontFamily: 'Sen',
                      fontWeight: FontWeight.w400,
                      fontSize: sizer.setSp(20),
                      height: 1.0,
                      color: const Color(0xFF32343E),
                    ),
                  ),

                  SizedBox(height: sizer.setHeight(5)),

                  /// Cuisine Types
                  Text(
                    cuisineTypes,
                    style: TextStyle(
                      fontFamily: 'Sen',
                      fontWeight: FontWeight.w400,
                      fontSize: sizer.setSp(14),
                      height: 1.0,
                      color: const Color(0xFFA0A5BA),
                    ),
                  ),

                  SizedBox(height: sizer.setHeight(8)),

                  /// Rating, Delivery Info, Time
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
                      Text(
                        rating,
                        style: TextStyle(
                          fontFamily: 'Sen',
                          fontWeight: FontWeight.w700,
                          fontSize: sizer.setSp(16),
                          height: 1.0,
                          color: const Color(0xFF32343E),
                        ),
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
                      Text(
                        deliveryInfo,
                        style: TextStyle(
                          fontFamily: 'Sen',
                          fontWeight: FontWeight.w400,
                          fontSize: sizer.setSp(14),
                          height: 1.0,
                          color: const Color(0xFF32343E),
                        ),
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
                      Text(
                        deliveryTime,
                        style: TextStyle(
                          fontFamily: 'Sen',
                          fontWeight: FontWeight.w400,
                          fontSize: sizer.setSp(14),
                          height: 1.0,
                          color: const Color(0xFF32343E),
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
  }
}
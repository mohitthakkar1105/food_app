import 'package:flutter/material.dart';
import '../utils/sizer.dart';

class TrendingReelCard extends StatelessWidget {
  final String imagePath;
  final String dishName;
  final String views;
  final VoidCallback? onTap;

  const TrendingReelCard({
    super.key,
    required this.imagePath,
    required this.dishName,
    required this.views,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final sizer = Sizer()..init(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: sizer.setWidth(122),
        height: sizer.setHeight(215),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFD8DAE0).withOpacity(0.4),
              offset: const Offset(0, 4),
              blurRadius: 12,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          children: [
            /// 📸 Image with overlay
            Positioned(
              top: sizer.setHeight(11),
              left: sizer.setWidth(13),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      imagePath,
                      width: sizer.setWidth(96),
                      height: sizer.setHeight(194),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        print('Image load error: $error');
                        return Container(
                          width: sizer.setWidth(96),
                          height: sizer.setHeight(194),
                          color: Colors.grey[300],
                          child: Icon(
                            Icons.broken_image,
                            size: sizer.setWidth(40),
                            color: Colors.grey[600],
                          ),
                        );
                      },
                    ),
                  ),

                  /// Gradient Overlay for better text visibility
                  Container(
                    width: sizer.setWidth(96),
                    height: sizer.setHeight(194),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.4),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// ▶ Play Button (White)
            Positioned(
              top: sizer.setHeight(31),
              right: sizer.setWidth(18),
              child: Container(
                width: sizer.setWidth(23.5),
                height: sizer.setWidth(23.5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: const Color(0xFF1C1C28),
                  size: sizer.setWidth(16),
                ),
              ),
            ),

            /// 🍕 Dish Name (Inside Image at Bottom)
            Positioned(
              bottom: sizer.setHeight(55),
              left: sizer.setWidth(17),
              child: Text(
                dishName,
                style: TextStyle(
                  fontFamily: "Sen",
                  fontWeight: FontWeight.w700,
                  fontSize: sizer.setSp(14),
                  height: 1,
                  color: Colors.white,
                ),
              ),
            ),

            /// 👁 Views (Inside Image at Bottom)
            Positioned(
              bottom: sizer.setHeight(45),
              left: sizer.setWidth(17),
              child: Text(
                views,
                style: TextStyle(
                  fontFamily: "Sen",
                  fontWeight: FontWeight.w400,
                  fontSize: sizer.setSp(10),
                  height: 1,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/// ==================== CATEGORY CARD (NEW) ====================
class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String dishName;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.imagePath,
    required this.dishName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final sizer = Sizer()..init(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: sizer.setWidth(92.14),
        height: sizer.setHeight(112),
        child: Column(
          children: [
            /// Image Container
            Container(
              width: sizer.setWidth(92.14),
              height: sizer.setHeight(61),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xADD8DAE0),
                    offset: Offset(1, 12),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  /// Background Container
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),

                  /// Image
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        imagePath,
                        width: sizer.setWidth(72.33),
                        height: sizer.setHeight(40),
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          print('Category image error: $error');
                          return Container(
                            width: sizer.setWidth(72.33),
                            height: sizer.setHeight(40),
                            color: Colors.grey[300],
                            child: Icon(
                              Icons.broken_image,
                              size: sizer.setWidth(20),
                              color: Colors.grey[600],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: sizer.setHeight(29)),

            /// Dish Name
            Text(
              dishName,
              style: TextStyle(
                fontFamily: 'Sen',
                fontWeight: FontWeight.w700,
                fontSize: sizer.setSp(18),
                height: 1.0,
                color: const Color(0xFF32343E),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}


/// ==================== SECTION HEADER ====================
class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAllTap;

  const SectionHeader({
    super.key,
    required this.title,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    final sizer = Sizer()..init(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizer.setWidth(27)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Title
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Sen',
              fontWeight: FontWeight.w400,
              fontSize: sizer.setSp(20),
              height: 1.0,
              color: const Color(0xFF32343E),
            ),
          ),

          /// See All Button
          GestureDetector(
            onTap: onSeeAllTap,
            child: Row(
              children: [
                Text(
                  'See All',
                  style: TextStyle(
                    fontFamily: 'Sen',
                    fontWeight: FontWeight.w400,
                    fontSize: sizer.setSp(16),
                    height: 1.0,
                    letterSpacing: -0.33,
                    color: const Color(0xFFFF7622
                    ),
                  ),
                ),
                SizedBox(width: sizer.setWidth(10)),
                Icon(
                  Icons.arrow_forward_ios,
                  color: const Color(0xFFFF7622),
                  size: sizer.setWidth(10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
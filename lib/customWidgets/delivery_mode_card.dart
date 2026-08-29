import 'package:flutter/material.dart';
import 'package:foodie/utils/App_colors.dart';
import '../utils/sizer.dart';

class DeliveryModeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final String price;
  final bool isSelected;
  final bool showFasterBadge;
  final bool showProBadge;
  final VoidCallback onTap;
  final String? imagePath;
  final Sizer sizer;

  const DeliveryModeCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.price,
    required this.isSelected,
    this.showFasterBadge = false,
    this.showProBadge = false,
    required this.onTap,
    this.imagePath,
    required this.sizer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    // Calculate top position based on badges
    final double titleTop = (showFasterBadge || showProBadge) ? 57 : 27;
    final double subtitleTop = (showFasterBadge || showProBadge) ? 82 : 52;
    final double timeTop = (showFasterBadge || showProBadge) ? 105 : 75;
    final double buttonTop = (showFasterBadge || showProBadge) ? 132 : 102;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: sizer.setWidth(323),
        height: sizer.setHeight(171),
        margin: EdgeInsets.only(left: sizer.setWidth(31)),
        decoration: BoxDecoration(
          color: scheme.secondary,
          borderRadius: BorderRadius.circular(sizer.setWidth(20)),
          border: Border.all(
            color: isSelected
                ? scheme.primary
                : const Color(0xFFE5E7EB),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x40000000),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Badges Row
            if (showFasterBadge || showProBadge)
              Positioned(
                top: sizer.setHeight(27),
                left: sizer.setWidth(26),
                child: Row(
                  children: [
                    // FASTER Badge
                    if (showFasterBadge)
                      Container(
                        width: sizer.setWidth(58),
                        height: sizer.setHeight(20),
                        decoration: BoxDecoration(
                          color: scheme.primary,
                          borderRadius: BorderRadius.circular(sizer.setWidth(20)),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'FASTER',
                          style: TextStyle(
                            fontFamily: 'Sen',
                            fontWeight: FontWeight.w600,
                            fontSize: sizer.setSp(12),
                            height: 1.0,
                            letterSpacing: 0,
                            color: scheme.onPrimary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    if (showFasterBadge && showProBadge)
                      SizedBox(width: sizer.setWidth(6)),
                    // PRO Badge
                    if (showProBadge)
                      Container(
                        width: sizer.setWidth(39),
                        height: sizer.setHeight(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F8F8),
                          borderRadius: BorderRadius.circular(sizer.setWidth(20)),
                          border: Border.all(
                            color: AppColors.primary,
                            width: 1,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'PRO',
                          style: TextStyle(
                            fontFamily: 'Sen',
                            fontWeight: FontWeight.w600,
                            fontSize: sizer.setSp(12),
                            height: 1.0,
                            letterSpacing: 0,
                            color: AppColors.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ],
                ),
              ),

            // Title
            Positioned(
              top: sizer.setHeight(titleTop),
              left: sizer.setWidth(26),
              child: SizedBox(
                width: sizer.setWidth(117),
                height: sizer.setHeight(19),
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Sen',
                    fontWeight: FontWeight.w500,
                    fontSize: sizer.setSp(16),
                    height: 1.0,
                    letterSpacing: 0,
                    color: scheme.onBackground,
                  ),
                ),
              ),
            ),

            // Subtitle
            Positioned(
              top: sizer.setHeight(subtitleTop),
              left: sizer.setWidth(24),
              child: SizedBox(
                width: sizer.setWidth(197),
                height: sizer.setHeight(17),
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: 'Sen',
                    fontWeight: FontWeight.w400,
                    fontSize: sizer.setSp(14),
                    height: 1.0,
                    letterSpacing: 0,
                    color: scheme.onSurface,
                  ),
                ),
              ),
            ),

            // Time Icon
            Positioned(
              top: sizer.setHeight(timeTop),
              left: sizer.setWidth(24),
              child: Icon(
                Icons.access_time,
                size: sizer.setWidth(14),
                color: AppColors.primary,
              ),
            ),

            // Time Text
            Positioned(
              top: sizer.setHeight(timeTop),
              left: sizer.setWidth(42),
              child: SizedBox(
                width: sizer.setWidth(53),
                height: sizer.setHeight(14),
                child: Text(
                  time,
                  style: TextStyle(
                    fontFamily: 'Sen',
                    fontWeight: FontWeight.w500,
                    fontSize: sizer.setSp(12),
                    height: 1.0,
                    letterSpacing: 0,
                    color: scheme.onBackground,
                  ),
                ),
              ),
            ),


            // Price Text
            Positioned(
              top: sizer.setHeight(timeTop),
              left: sizer.setWidth(124),
              child: SizedBox(
                width: sizer.setWidth(30),
                height: sizer.setHeight(14),
                child: Text(
                  price,
                  style: TextStyle(
                    fontFamily: 'Sen',
                    fontWeight: FontWeight.w500,
                    fontSize: sizer.setSp(11),
                    height: 1.0,
                    letterSpacing: 0,
                    color: scheme.onBackground,
                  ),
                ),
              ),
            ),

            // Select/Selected Button with Circle
            Positioned(
              top: sizer.setHeight(buttonTop),
              left: sizer.setWidth(26),
              child: Container(
                height: sizer.setHeight(22),
                padding: EdgeInsets.symmetric(
                  horizontal: sizer.setWidth(12),
                  vertical: sizer.setHeight(4),
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFFFF7622)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(sizer.setWidth(20)),
                  border: Border.all(
                    color: const Color(0xFFFF7622),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isSelected ? 'Selected' : 'Select',
                      style: TextStyle(
                        fontFamily: 'Sen',
                        fontWeight: FontWeight.w500,
                        fontSize: sizer.setSp(12),
                        height: 1.0,
                        letterSpacing: 0,
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFFFF7622),
                      ),
                    ),
                    SizedBox(width: sizer.setWidth(6)),
                    // Circle with tick or empty
                    Container(
                      width: sizer.setWidth(14),
                      height: sizer.setWidth(14),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.white
                            : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFFFF7622),
                          width: 1.5,
                        ),
                      ),
                      child: isSelected
                          ? Icon(
                        Icons.check,
                        size: sizer.setWidth(8),
                        color: const Color(0xFFFF7622),
                      )
                          : null,
                    ),
                  ],
                ),
              ),
            ),

            // Delivery Image
            if (imagePath != null)
              Positioned(
                top: sizer.setHeight(20),
                right: sizer.setWidth(20),
                child: Container(
                  width: sizer.setWidth(80),
                  height: sizer.setWidth(80),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(sizer.setWidth(12)),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.white,
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(sizer.setWidth(12)),
                    child: Image.asset(
                      imagePath!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
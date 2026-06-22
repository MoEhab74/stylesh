import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';

class BannerCard extends StatelessWidget {
  final String discountText;
  final String productTitle;
  final String subtitle;
  final String imagePath;

  const BannerCard({
    super.key,
    required this.discountText,
    required this.productTitle,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.bannerPinkDark, AppColors.bannerPinkLight],
        ),
      ),
      child: Row(
        children: [
          // Left Content
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Discount Text
                  Flexible(
                    child: Text(
                      discountText,
                      style: AppTextStyles.montserratBold20w700.copyWith(
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  // Product Title
                  Text(
                    "Now in $productTitle",
                    style: AppTextStyles.montserratRegular14w400.copyWith(
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  // Subtitle
                  Text(
                    subtitle,
                    style: AppTextStyles.montserratRegular14w400.copyWith(
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  // Shop Now Button
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 12.sp,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Shop Now",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(color: Colors.white, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Right Image
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

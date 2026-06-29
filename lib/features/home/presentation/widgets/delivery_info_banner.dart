import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';

class DeliveryInfoBanner extends StatelessWidget {
  const DeliveryInfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery in',
            style: AppTextStyles.montserratRegular14w400.copyWith(
              color: AppColors.blackColor,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            '1 within Hour',
            style: AppTextStyles.montserratSemiBold18w600.copyWith(
              color: AppColors.blackColor,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}


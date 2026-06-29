import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';

class HeaderActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const HeaderActionButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(4.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            label,
            style: AppTextStyles.montserratRegular12w400.copyWith(
              color: AppColors.blackColor,
              fontSize: 11.sp,
            ),
          ),
          SizedBox(width: 2.w),
          Icon(icon, size: 14.sp, color: AppColors.blackColor),
        ],
      ),
    );
  }
}


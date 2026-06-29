import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/features/home/presentation/widgets/header_action_button.dart';

class SimilarProductsHeader extends StatelessWidget {
  const SimilarProductsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Similar To',
              style: AppTextStyles.montserratSemiBold18w600.copyWith(
                color: AppColors.blackColor,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              '282+ Items',
              style: AppTextStyles.montserratRegular12w400.copyWith(
                color: AppColors.textSecondary,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        Row(
          children: [
            HeaderActionButton(icon: Icons.sort, label: 'Sort'),
            SizedBox(width: 8.w),
            HeaderActionButton(icon: Icons.filter_alt_outlined, label: 'Filter'),
          ],
        ),
      ],
    );
  }
}


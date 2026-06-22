import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';

class ProductsActionWidget extends StatelessWidget {
  const ProductsActionWidget({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 62.w,
      height: 24.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            style: AppTextStyles.montserratRegular14w400.copyWith(
              fontSize: 12.sp,
              color: AppColors.blackColor,
            ),
          ),
          icon,
        ],
      ),
    );
  }
}

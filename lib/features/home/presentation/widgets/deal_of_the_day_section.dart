import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';

class DealOfTheDaySection extends StatelessWidget {
  const DealOfTheDaySection({
    super.key,
    required this.backgroundColor,
    required this.dealTitle,
    required this.dealSubtitle,
    required this.dealIcon,
  });
  final Color backgroundColor;
  final String dealTitle;
  final String dealSubtitle;
  final IconData dealIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dealTitle,
                style: AppTextStyles.montserratSemiBold18w600.copyWith(
                  color: Colors.white,
                  fontSize: 18.sp,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CustomSizedBox(
                  height: 28.h,
                  width: 90.w,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(color: Colors.white, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "View All",
                          style: AppTextStyles.montserratSemiBold12w600,
                        ),
                        const CustomSizedBox(width: 4),
                        Expanded(
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(dealIcon, size: 16, color: Colors.white),
              const SizedBox(width: 4),
              Text(
                dealSubtitle,
                style: AppTextStyles.montserratRegular12w400.copyWith(
                  color: Colors.white,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

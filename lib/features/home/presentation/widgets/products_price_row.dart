import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';

class ProductPriceRow extends StatelessWidget {
  final String currentPrice;
  final String oldPrice;
  final String discount;

  const ProductPriceRow({
    super.key,
    required this.currentPrice,
    required this.oldPrice,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price row: current price + old price + discount
        Row(
          children: [
            Flexible(
              child: Text(
                currentPrice,
                style: AppTextStyles.montserratSemiBold18w600.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 15.sp,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 6.w),
            Flexible(
              child: Text(
                oldPrice,
                style: AppTextStyles.montserratRegular14w400.copyWith(
                  color: AppColors.borderColor,
                  fontSize: 12.sp,
                  decoration: TextDecoration.lineThrough,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 6.w),
            Flexible(
              child: Text(
                discount,
                style: AppTextStyles.montserratRegular12w400.copyWith(
                  color: Colors.green,
                  fontSize: 12.sp,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
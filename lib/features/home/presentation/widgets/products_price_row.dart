import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';

class ProductPriceRow extends StatelessWidget {
  final String currentPrice;
  final String oldPrice;
  final String discount;
  final TextStyle? currentPriceStyle;
  final TextStyle? oldPriceStyle;
  final TextStyle? discountStyle;
  final double? spacing;

  const ProductPriceRow({
    super.key,
    required this.currentPrice,
    required this.oldPrice,
    required this.discount,
    this.currentPriceStyle,
    this.oldPriceStyle,
    this.discountStyle,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveSpacing = spacing ?? 6.w;
    final effectiveCurrentPriceStyle = currentPriceStyle ??
        AppTextStyles.montserratSemiBold18w600.copyWith(
          color: AppColors.primaryColor,
          fontSize: 15.sp,
        );
    final effectiveOldPriceStyle = oldPriceStyle ??
        AppTextStyles.montserratRegular14w400.copyWith(
          color: AppColors.borderColor,
          fontSize: 12.sp,
          decoration: TextDecoration.lineThrough,
        );
    final effectiveDiscountStyle = discountStyle ??
        AppTextStyles.montserratRegular12w400.copyWith(
          color: Colors.green,
          fontSize: 12.sp,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price row: current price + old price + discount
        Row(
          children: [
            Flexible(
              child: Text(
                currentPrice,
                style: effectiveCurrentPriceStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: effectiveSpacing),
            Flexible(
              child: Text(
                oldPrice,
                style: effectiveOldPriceStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: effectiveSpacing),
            Flexible(
              child: Text(
                discount,
                style: effectiveDiscountStyle,
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
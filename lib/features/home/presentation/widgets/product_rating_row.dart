import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';

class ProductRatingRow extends StatelessWidget {
  final double rating;
  final int reviewCount;
  final double? starSize;
  final TextStyle? reviewTextStyle;
  final double? spacing;
  final Color? iconColor;

  const ProductRatingRow({
    super.key,
    required this.rating,
    required this.reviewCount,
    this.starSize,
    this.reviewTextStyle,
    this.spacing,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveStarSize = starSize ?? 13.sp;
    final effectiveSpacing = spacing ?? 4.w;
    final effectiveIconColor = iconColor ?? Colors.amber;
    final effectiveTextStyle = reviewTextStyle ??
        AppTextStyles.montserratRegular12w400.copyWith(
          color: AppColors.borderColor,
          fontSize: 11.sp,
        );

    return Row(
      children: [
        _buildStars(effectiveStarSize, effectiveIconColor),
        SizedBox(width: effectiveSpacing),
        Flexible(
          child: Text(
            _formatReviewCount(reviewCount),
            style: effectiveTextStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  // ✅ 56890 → "56K" أوضح للمستخدم
  String _formatReviewCount(int count) {
    if (count >= 1000) return "${(count / 1000).toStringAsFixed(0)}K";
    return count.toString();
  }

  Widget _buildStars(double size, Color activeColor) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) => Icon(
          index < rating.floor() ? Icons.star : Icons.star_border,
          size: size,
          color: index < rating.floor() ? activeColor : Colors.grey,
        ),
      ),
    );
  }
}
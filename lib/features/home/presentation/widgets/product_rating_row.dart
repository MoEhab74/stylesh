import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';

class ProductRatingRow extends StatelessWidget {
  final double rating;
  final int reviewCount;

  const ProductRatingRow({
    super.key,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildStars(),
        SizedBox(width: 4.w),
        Flexible(
          child: Text(
            _formatReviewCount(reviewCount),
            style: AppTextStyles.montserratRegular12w400.copyWith(
              color: AppColors.borderColor,
              fontSize: 11.sp,
            ),
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

  Widget _buildStars() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) => Icon(
          index < rating.floor() ? Icons.star : Icons.star_border,
          size: 13.sp, // ✅ صغّرنا شوية
          color: index < rating.floor() ? Colors.amber : Colors.grey,
        ),
      ),
    );
  }
}
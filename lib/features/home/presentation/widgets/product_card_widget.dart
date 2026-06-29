import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/features/home/data/models/product_model.dart';
import 'package:stylesh/features/home/presentation/widgets/product_rating_row.dart';
import 'package:stylesh/features/home/presentation/widgets/products_price_row.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      margin: EdgeInsets.only(right: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProductImage(imageUrl: product.imageUrl),
          SizedBox(height: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductTitle(title: product.title),
                SizedBox(height: 4.w),
                ProductDescription(description: product.description),
                SizedBox(height: 6.w),
                ProductPriceRow(
                  currentPrice: product.currentPrice,
                  oldPrice: product.oldPrice,
                  discount: product.discount,
                ),
                // const Spacer(),
                ProductRatingRow(
                  rating: product.rating,
                  reviewCount: product.reviewCount,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final String imageUrl;

  const _ProductImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: AspectRatio(
        aspectRatio: 1.2, // Maintain aspect ratio for consistency
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => Container(
            color: AppColors.borderColor.withValues(alpha: 0.2),
            child: const Icon(Icons.broken_image),
          ),
        ),
      ),
    );
  }
}

class ProductTitle extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color? color;

  const ProductTitle({
    super.key,
    required this.title,
    this.style,
    this.maxLines,
    this.overflow,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style ??
          AppTextStyles.montserratSemiBold14w600.copyWith(
            color: color ?? AppColors.blackColor,
            fontSize: 14.sp,
          ),
      maxLines: maxLines ?? 1,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }
}

class ProductDescription extends StatelessWidget {
  final String description;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color? color;

  const ProductDescription({
    super.key,
    required this.description,
    this.style,
    this.maxLines,
    this.overflow,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: style ??
          AppTextStyles.montserratRegular12w400.copyWith(
            color: color ?? AppColors.borderColor,
            fontSize: 12.sp,
          ),
      maxLines: maxLines ?? 1,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }
}


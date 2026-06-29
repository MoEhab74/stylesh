import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylesh/core/routing/app_routes.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/features/home/data/models/product_model.dart';
import 'package:stylesh/features/home/presentation/cubit/Products_cubit/products_cubit.dart';
import 'package:stylesh/features/home/presentation/cubit/Products_cubit/products_state.dart';
import 'package:stylesh/features/home/presentation/widgets/product_card_widget.dart';
import 'package:stylesh/features/home/presentation/widgets/product_rating_row.dart';
import 'package:stylesh/features/home/presentation/widgets/products_price_row.dart';

class SimilarProductsGrid extends StatefulWidget {
  final String categoryId;
  const SimilarProductsGrid({super.key, required this.categoryId});

  @override
  State<SimilarProductsGrid> createState() => _SimilarProductsGridState();
}

class _SimilarProductsGridState extends State<SimilarProductsGrid> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<ProductsCubit>().getProductsByCategory(
          categoryId: widget.categoryId,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) =>
          current is ProductsLoading || current is ProductsLoaded || current is ProductsError,
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductsError) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(color: AppColors.primaryColor),
            ),
          );
        } else if (state is ProductsLoaded) {
          final products = state.products;
          if (products.isEmpty) {
            return const Center(child: Text('No similar items found'));
          }
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.62,
            ),
            itemCount: products.length > 4 ? 4 : products.length,
            itemBuilder: (context, index) {
              final prod = products[index];
              return ProductGridCard(product: prod);
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class ProductGridCard extends StatelessWidget {
  final ProductModel product;
  const ProductGridCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.productDetails, extra: {'productId': product.id});
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withValues(alpha: 0.04),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
              child: AspectRatio(
                aspectRatio: 1.1,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(
                    color: AppColors.borderColor.withValues(alpha: 0.2),
                    child: const Icon(Icons.broken_image),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitle(title: product.title),
                  SizedBox(height: 2.w),
                  ProductDescription(description: product.description),
                  SizedBox(height: 4.w),
                  ProductPriceRow(
                    currentPrice: product.currentPrice,
                    oldPrice: product.oldPrice,
                    discount: product.discount,
                    currentPriceStyle: AppTextStyles.montserratSemiBold14w600.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 13.sp,
                    ),
                    oldPriceStyle: AppTextStyles.montserratRegular12w400.copyWith(
                      color: AppColors.borderColor,
                      fontSize: 10.sp,
                      decoration: TextDecoration.lineThrough,
                    ),
                    discountStyle: AppTextStyles.montserratRegular12w400.copyWith(
                      color: AppColors.accentGreen,
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(height: 4.w),
                  ProductRatingRow(
                    rating: product.rating,
                    reviewCount: product.reviewCount,
                    starSize: 10.sp,
                    reviewTextStyle: AppTextStyles.montserratRegular12w400.copyWith(
                      color: AppColors.borderColor,
                      fontSize: 9.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

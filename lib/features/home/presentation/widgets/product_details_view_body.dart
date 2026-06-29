import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:stylesh/core/utils/app_colors.dart';
import 'package:stylesh/core/utils/text_styles.dart';
import 'package:stylesh/core/widgets/custom_app_bar.dart';
import 'package:stylesh/core/widgets/custom_sized_box.dart';
import 'package:stylesh/core/widgets/expandable_text.dart';
import 'package:stylesh/core/widgets/size_selector.dart';
import 'package:stylesh/features/home/data/models/product_model.dart';
import 'package:stylesh/features/home/presentation/cubit/Products_cubit/products_cubit.dart';
import 'package:stylesh/features/home/presentation/cubit/Products_cubit/products_state.dart';
import 'package:stylesh/features/home/presentation/widgets/delivery_info_banner.dart';
import 'package:stylesh/features/home/presentation/widgets/product_actions_buttoms.dart';
import 'package:stylesh/features/home/presentation/widgets/product_card_widget.dart';
import 'package:stylesh/features/home/presentation/widgets/product_page_view_builder.dart';
import 'package:stylesh/features/home/presentation/widgets/product_quick_action_rows.dart';
import 'package:stylesh/features/home/presentation/widgets/product_rating_row.dart';
import 'package:stylesh/features/home/presentation/widgets/product_tags_row.dart';
import 'package:stylesh/features/home/presentation/widgets/products_price_row.dart';
import 'package:stylesh/features/home/presentation/widgets/similar_products_grid.dart';
import 'package:stylesh/features/home/presentation/widgets/similar_products_header.dart';
import 'package:stylesh/generated/assets.dart';

class ProductDetailViewBody extends StatefulWidget {
  const ProductDetailViewBody({
    super.key,
    required this.productId,
    this.onBackPressed,
  });

  final int productId;
  final VoidCallback? onBackPressed;

  @override
  State<ProductDetailViewBody> createState() => _ProductDetailViewBodyState();
}

class _ProductDetailViewBodyState extends State<ProductDetailViewBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<ProductsCubit>().getProductById(
          productId: widget.productId,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Add Scaffold
    return Scaffold(
      body:
          // This is a placeholder for the product details widget.
          SafeArea(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductDetailsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductDetailsError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                } else if (state is ProductDetailsLoaded) {
                  return BlocProvider(
                    create: (context) => ProductsCubit(homeRepo: context.read<ProductsCubit>().homeRepo),
                    child: ProductDetailsWidget(
                      product: state.product,
                      onBackPressed: widget.onBackPressed,
                    ),
                  );
                } else {
                  return Center(child: Text("No Products"));
                }
              },
            ),
          ),
    );
  }
}

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({
    super.key,
    required this.product,
    this.onBackPressed,
  });
  final ProductModel product;
  final VoidCallback? onBackPressed;

  // Hardcoded sizes until the API provides them
  static const List<String> _sizes = ['S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    if (onBackPressed != null) {
                      onBackPressed!();
                    } else {
                      GoRouter.of(context).pop();
                    }
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                CustomAppBarIconWidget(
                  icon: SvgPicture.asset(Assets.assetsIconsShoppingCart),
                ),
              ],
            ),
          ),
          CustomSizedBox(height: 16.h),

          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: ProductPageViewBuilder(imageList: product.images ?? []),
          ),
          CustomSizedBox(height: 20.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Size',
                  style: AppTextStyles.montserratSemiBold14w600.copyWith(
                    color: AppColors.blackColor,
                    fontSize: 16.sp,
                  ),
                ),
                CustomSizedBox(height: 10.h),

                SizeSelector(items: _sizes),
                CustomSizedBox(height: 16.h),

                ProductTitle(
                  title: product.title,
                  style: AppTextStyles.montserratSemiBold18w600.copyWith(
                    color: AppColors.blackColor,
                    fontSize: 20.sp,
                  ),
                  maxLines: 2,
                ),
                CustomSizedBox(height: 6.h),

                ProductDescription(
                  description: product.category?.name ?? '',
                  style: AppTextStyles.montserratRegular14w400.copyWith(
                    color: AppColors.borderColor,
                    fontSize: 14.sp,
                  ),
                  maxLines: 1,
                ),
                CustomSizedBox(height: 10.h),

                ProductRatingRow(
                  rating: product.rating,
                  reviewCount: product.reviewCount,
                  starSize: 18.sp,
                  spacing: 6.w,
                  reviewTextStyle:
                      AppTextStyles.montserratRegular14w400.copyWith(
                        color: AppColors.borderColor,
                        fontSize: 14.sp,
                      ),
                ),
                CustomSizedBox(height: 10.h),

                ProductPriceRow(
                  currentPrice: product.currentPrice,
                  oldPrice: product.oldPrice,
                  discount: product.discount,
                  spacing: 8.w,
                  currentPriceStyle:
                      AppTextStyles.montserratSemiBold18w600.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 18.sp,
                      ),
                  oldPriceStyle:
                      AppTextStyles.montserratRegular14w400.copyWith(
                        color: AppColors.borderColor,
                        fontSize: 14.sp,
                        decoration: TextDecoration.lineThrough,
                      ),
                  discountStyle:
                      AppTextStyles.montserratRegular14w400.copyWith(
                        color: AppColors.accentGreen,
                        fontSize: 14.sp,
                      ),
                ),
                CustomSizedBox(height: 16.h),

                Text(
                  'Product Details',
                  style: AppTextStyles.montserratSemiBold14w600.copyWith(
                    color: AppColors.blackColor,
                    fontSize: 16.sp,
                  ),
                ),
                CustomSizedBox(height: 8.h),
                ExpandableText(
                  text: product.description,
                  trimLines: 3,
                  textStyle: AppTextStyles.montserratRegular12w400.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 13.sp,
                    height: 1.6,
                  ),
                ),
                CustomSizedBox(height: 16.h),

                // 1. Tags/Chips Row
                const ProductTagsRow(),
                CustomSizedBox(height: 20.h),

                // 2. Action Buttons Row
                const ProductActionButtons(),
                CustomSizedBox(height: 20.h),

                // 3. Delivery Info Banner
                const DeliveryInfoBanner(),
                CustomSizedBox(height: 20.h),

                // 4. View Similar / Add to Compare Row
                const ProductQuickActionsRow(),
                CustomSizedBox(height: 24.h),

                // 5. Similar Products Header
                const SimilarProductsHeader(),
                CustomSizedBox(height: 16.h),

                // 6. Similar Products Grid
                SimilarProductsGrid(categoryId: product.category?.id.toString() ?? '1'),
                CustomSizedBox(height: 24.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
